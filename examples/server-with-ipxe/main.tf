terraform {
  required_providers {
    latitudesh = {
      source  = "latitudesh/latitudesh"
      version = ">= 2.5.0"
    }
  }
}

provider "latitudesh" {
  auth_token = var.latitude_auth_token
}

module "server" {
  source = "../../"

  hostname         = "tf-module-test-simple-server"
  operating_system = "ubuntu_24_04_x64_lts"
  plan             = "c2-small-x86"
  project          = "proj_X6KG5m9Lk5yPB"
  site             = "SAO2"

  ipxe_url = "https://raw.githubusercontent.com/latitudesh/examples/refs/heads/main/custom-images-v2/netboot/boot.ipxe"
}
