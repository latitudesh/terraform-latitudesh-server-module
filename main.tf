################################################################################
# Server
################################################################################

resource "latitudesh_server" "this" {
  hostname         = var.hostname
  operating_system = var.operating_system
  plan             = var.plan
  project          = var.project
  site             = var.site

  # Optional variables
  billing         = var.billing
  ipxe            = var.ipxe
  locked          = var.locked
  allow_reinstall = var.allow_reinstall
  raid            = var.raid
  ssh_keys        = var.ssh_keys
  tags            = var.tags
  user_data       = var.user_data


}