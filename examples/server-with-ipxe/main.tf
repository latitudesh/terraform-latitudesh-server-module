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

  hostname         = "tf-module-test-ipxe"
  operating_system = "ipxe"
  plan             = "c2-small-x86"
  project          = "proj_X6KG5m9Lk5yPB"
  site             = "SAO2"

  ipxe = "https://raw.githubusercontent.com/latitudesh/examples/refs/heads/main/custom-images-v2/netboot/boot.ipxe"
}
