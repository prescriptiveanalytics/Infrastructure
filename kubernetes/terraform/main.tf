
terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.37.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.provider_endpoint
  username = var.provider_username
  password = var.provider_password
  insecure = true
}