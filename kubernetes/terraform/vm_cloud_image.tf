# resource "proxmox_virtual_environment_download_file" "cloud_image" {
#   content_type = "iso"
#   datastore_id = "local"
#   node_name    = var.node_name
#   url          = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
#   file_name    = "Ubuntu_noble-server-cloudimg_managed_by_spa_terraform_runner_do_not_delete.img"
# }

# resource "proxmox_virtual_environment_download_file" "cloud_image" {
#   content_type = "iso"
#   datastore_id = "local"
#   node_name    = var.node_name
#   url          = "https://cdimage.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2"
#   file_name    = "debian-12-cloudimg_managed_by_spa_terraform_runner_do_not_delete.img"
# }

resource "proxmox_virtual_environment_download_file" "cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name
  url          = "https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2"
  file_name    = "CentOS-9-cloudimg_DO_NOT_DELETE_managed_by_spa_terraform_runner.img"
}