resource "proxmox_virtual_environment_download_file" "CentOS_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name
  url          = "https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-latest.x86_64.qcow2"
  file_name    = "CentOS8-genericcloud.img"
}