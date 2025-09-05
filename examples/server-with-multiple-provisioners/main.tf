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

  hostname         = "full-stack-server"
  operating_system = "ubuntu_24_04_x64_lts"
  plan             = "c3-large-x86"
  project          = "proj_X6KG5m9Lk5yPB"
  site             = "SAO"

  # Opcionais
  billing  = "monthly"
  raid     = "raid-1"
  ssh_keys = [file("~/.ssh/id_rsa.pub")]

  provisioners = {
    remote_exec = {
      inline = [
        "sudo apt-get update -y",
        "sudo apt-get install -y docker.io",
        "sudo systemctl start docker",
        "sudo systemctl enable docker",
        "sudo usermod -aG docker ubuntu"
      ]
      connection = {
        type        = "ssh"
        private_key = file("~/.ssh/id_rsa")
        timeout     = "5m"
      }
    }

    local_exec = {
      command = "ansible-playbook -i '${self.primary_ipv4},' deploy-app.yml"
      environment = {
        ANSIBLE_HOST_KEY_CHECKING = "False"
      }
    }
  }
}