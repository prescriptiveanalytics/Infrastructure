resource "proxmox_virtual_environment_vm" "k8s_cp" {
  count = var.number_of_control_planes

  name        = "k8s-cp-${count.index + 1}"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = var.node_name

  vm_id = 1100 + count.index + 1

  cpu {
    cores = 3
    type = "host"
  }

  memory {
    dedicated = 6144
  }

  agent {
    enabled = true
  }

  network_device {
    bridge = "vmbr0"
    vlan_id = var.vlan_id
  }

  # clone {
  #   vm_id = 100
  #   retries = 10
  # }

  disk {
    datastore_id = "dellsan"
    file_id      = proxmox_virtual_environment_download_file.cloud_image.id
    interface    = "ide0"
    size         = 40
  }

  initialization {
    datastore_id = "local-lvm"
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    user_account {
      keys     = [var.vm_public_key]
      username = var.vm_username
      password = var.vm_password
    }
  }
}
