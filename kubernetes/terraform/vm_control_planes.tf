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
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 50
  }

  serial_device {} # The Debian cloud image expects a serial port to be present

  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }

  clone {
    datastore_id = "local-lvm"
    vm_id = var.template_vm_id
  }

  initialization {
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
