resource "proxmox_virtual_environment_vm" "k8s_cp" {
  count = var.number_of_control_planes

  name        = "k8s-cp-${count.index}"
  description = "Managed by Terraform"
  tags        = ["terraform"]
  node_name   = var.node_name

  cpu {
    cores = 3
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

  disk {
    datastore_id = "dellsan"
    file_id      = proxmox_virtual_environment_download_file.CentOS_cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
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
