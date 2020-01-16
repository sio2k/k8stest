provider "azurerm" {
  version = "~> 1.40"
}

resource "azurerm_resource_group" "aks" {
  name     = "${var.env}-aks-${var.id}-rg"
  location = var.region
  tags = {
    environment = var.env
  }
}

resource "azurerm_virtual_network" "aks" {
  name                = "${var.env}-aks-network"
  location            = var.region
  resource_group_name = azurerm_resource_group.aks.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "aks" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.aks.name
  address_prefix       = "10.1.0.0/24"
  virtual_network_name = azurerm_virtual_network.aks.name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.env}-aks-${var.id}"
  location            = var.region
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "${var.env}-aks-${var.id}"
  kubernetes_version  = var.k8s_version

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  agent_pool_profile {
    type                = "VirtualMachineScaleSets"
    vnet_subnet_id      = azurerm_subnet.aks.id
    name                = "${var.env}aks${var.id}"
    availability_zones  = var.availability_zones
    enable_auto_scaling = var.enable_auto_scaling
    min_count           = var.min_count
    max_count           = var.max_count
    max_pods            = var.max_pods
    vm_size             = var.agent_sku
    os_type             = "Linux"
    os_disk_size_gb     = 30
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

}