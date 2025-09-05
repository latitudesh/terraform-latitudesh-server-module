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

  hostname         = "tf-module-server-scripts"
  operating_system = "ubuntu_24_04_x64_lts"
  plan             = "c2-small-x86"
  project          = "proj_X6KG5m9Lk5yPB"
  site             = "SAO"

  ssh_keys = ["ssh_id_here"]

  provisioners = {
    remote_exec = {
      scripts = [
        "./install_docker.sh",
        "./configure_firewall.sh",
        "./install_nginx.sh",
      ]
      connection = {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
      }
    }
  }
}