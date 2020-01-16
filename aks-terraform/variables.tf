variable "env" {
  description = "Env to provision"
  default = "test"
}

variable "region" {
  description = "Azure region to provision cluster"
  default = "West Europe"
}

variable "id" {
  description = "Cluster id"
  default = "01"
}

variable "agent_sku" {
  description = "Azure SKU"
  default = "Standard_D2s_v3"
}

variable "max_pods" {
  description = "Max pods per node"
  default = 30
}

variable "k8s_version" {
  description = "K8S version"
  default = "1.15.7"
}

variable "enable_auto_scaling" {
  description = "Enable cluster auto scaling"
  default = true
}

variable "min_count" {
  description = "Min nodes"
  default = 1
}

variable "max_count" {
  description = "Max nodes"
  default = 2
}

variable "availability_zones" {
  description = "nodes on availablity zones"
  default = [1]
}

variable "client_id" {
  description = "Client id with contribute permission"
}
variable "client_secret" {
  description = "Client secret corresponding with client id"
}

variable "ssh_public_key" {
  default = "test.pub"
}