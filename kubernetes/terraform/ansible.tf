resource "local_file" "ansible_inventory" {
  filename = "/home/spainfra/terraform_state/kubernetes_cluster/inventory.ini"
  content     = <<-EOF
  %{ for controlplane in proxmox_virtual_environment_vm.k8s_cp[*] }
  ${controlplane.name} ansible_host=${controlplane.ipv4_addresses[1][0]} ansible_become=true
  %{ endfor }  %{ for worker_large in proxmox_virtual_environment_vm.k8s_worker_large[*] }
  ${worker_large.name} ansible_host=${worker_large.ipv4_addresses[1][0]} ansible_become=true
  %{ endfor }  %{ for worker_medium in proxmox_virtual_environment_vm.k8s_worker_medium[*] }
  ${worker_medium.name} ansible_host=${worker_medium.ipv4_addresses[1][0]} ansible_become=true
  %{ endfor }  %{ for worker_small in proxmox_virtual_environment_vm.k8s_worker_small[*] }
  ${worker_small.name} ansible_host=${worker_small.ipv4_addresses[1][0]} ansible_become=true
  %{ endfor }
  [kube_control_plane]
  %{ for controlplane in proxmox_virtual_environment_vm.k8s_cp[*] }
  ${controlplane.name}
  %{ endfor }
  [etcd]
  %{ for controlplane in proxmox_virtual_environment_vm.k8s_cp[*] }
  ${controlplane.name}
  %{ endfor }  
  [kube_node]
  %{ for worker_large in proxmox_virtual_environment_vm.k8s_worker_large[*] }
  ${worker_large.name} 
  %{ endfor }  %{ for worker_medium in proxmox_virtual_environment_vm.k8s_worker_medium[*] }
  ${worker_medium.name}
  %{ endfor }  %{ for worker_small in proxmox_virtual_environment_vm.k8s_worker_small[*] }
  ${worker_small.name}
  %{ endfor }
  [k8s_cluster:children]
  kube_node
  kube_control_plane

  [all:vars]
  ansible_python_interpreter=/usr/bin/python3
  ansible_ssh_extra_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
  ansible_ssh_private_key_file=~/.ssh/id_rsa
  ansible_user=${var.vm_username}
  EOF
}