## DevOps Engineer - Tech Test

### Instructions

We believe in `infrastructure as code` and automation of deployments.  We would like you to demonstrate your understanding and use of modern automated infrastructure and sysadmin. To demonstate this, your goal is to provision a simple web application of your choice that has a backend and database store (write a simple app or use an off-the-shelf set of Docker images).  Create an orchestrated cluster of nodes using any provisioning tool of your choice and deploy the application using an orchestration layer (e.g. Docker Swarm, Kubernetes, etc) to scale the application.  

### Solution notes
* Azure is used as an infrastructure provider 
* Terraform is used to automate AKS creation
* Kubernetes is used to automat deployment, scaling, and management of containerized applications
* Helm Charts are used to define, manage, install, and upgrade Kubernetes applications
* To compose an application and database layer in a correct fashion,MongoDb is used as a database it is exposed to other pods on the k8s via service. Community helm chart is used to provision the database. 
* Mongo-express is a custom helm chart to deploy a Web-based MongoDB admin interface. Mongo-express is exposed to the world via ngnix ingress. DNS is not configured so you can modify host files to test locally

### To execute
* prerequisite to be installed
  * https://www.terraform.io/
  * https://helm.sh/docs/intro/install/
  * https://kubernetes.io/docs/tasks/tools/install-kubectl/
  * Contributor acess to Azure portal

* Provision AKS with ./provision-aks.sh with client id/secret you should see somthing like

Plan: 6 to add, 0 to change, 0 to destroy.

Warning: "agent_pool_profile": [DEPRECATED] This has been replaced by `default_node_pool` and will be removed in version 2.0 of the AzureRM Provider

  on aks-terraform/main.tf line 27, in resource "azurerm_kubernetes_cluster" "aks":
  27: resource "azurerm_kubernetes_cluster" "aks" {



------------------------------------------------------------------------

This plan was saved to: test-aks

To perform exactly these actions, run the following command to apply:
    terraform apply "test-aks"

* If you are happy with target infrastructure execute terraform apply "test-aks"
* After cluster is provisioned exexcute ./schedule-test-app.sh

Screenshots for the 
