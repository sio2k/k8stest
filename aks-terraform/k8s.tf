provider "kubernetes" {
  version                = "~> 1.8"
  host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host  
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
}

resource "kubernetes_namespace" "k8s-ext-ingress" {
  metadata {
    name = "ing-ext"
  }
}

resource "kubernetes_namespace" "k8s-test-env" {
  metadata {
    name = "test"
  }
}
