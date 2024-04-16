resource "proxmox_virtual_environment_download_file" "debian12_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.node_name
  url          = "https://cdimage.debian.org/cdimage/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
  file_name    = "centos8.img"
}