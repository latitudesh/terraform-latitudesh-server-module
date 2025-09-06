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

  hostname         = "tf-module-server-local-exec"
  operating_system = "ubuntu_24_04_x64_lts"
  plan             = "c2-medium-x86"
  project          = "proj_KF4I5l07AXgB6" # replace with your project id
  site             = "SAO"

  provisioners = {
    local_exec = {
      command = "echo 'Server deployment completed' >> deployment.log"
    }
  }
}