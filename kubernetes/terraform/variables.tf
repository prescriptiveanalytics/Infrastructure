#Define variables for VM configuration
variable "number_of_control_planes" {
 type = number
}
variable "number_of_large_workers" {
 type = number
}
variable "number_of_medium_workers" {
 type = number
}
variable "number_of_small_workers" {
 type = number
}

#Define confidential variables for VM configuration
variable "node_name" {
 type = string
 sensitive = true
}
variable "vlan_id" {
 type = number
 sensitive = true
}

#Define confidential variables for endpoint
variable "provider_endpoint" {
 type = string
 sensitive = true
}
variable "provider_username" {
 type = string
 sensitive = true
}
variable "provider_password" {
 type = string
 sensitive = true
}

#Define confidential variables for VMs
variable "vm_password" {
 type = string
 sensitive = true
}
variable "vm_username" {
 type = string
 sensitive = true
}
variable "vm_public_key" {
 type = string
 sensitive = true
}