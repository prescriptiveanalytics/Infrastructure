
terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.66.3"
    }
  }
}

provider "proxmox" {
  endpoint = var.provider_endpoint
  username = var.provider_username
  password = var.provider_password
  insecure = true
}

terraform {
  backend "local" { path = "/home/spainfra/terraform_state/kubernetes_cluster/terraform.tfstate" }
}