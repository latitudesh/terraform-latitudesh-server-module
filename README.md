# Terraform Module for Latitude.sh Server Provisioning

## Usage

First, export the LatitudeSH authentication token:
```bash
export LATITUDESH_AUTH_TOKEN=<your_auth_token>
```

Then, you can use the module in your Terraform code:

### Simple Server

```hcl
module "server" {
  source = "git::https://github.com/latitudesh/terraform-latitudesh-server-module.git"

  hostname         = "tf-module-test-simple-server"
  operating_system = "ubuntu_24_04_x64_lts"
  plan             = "c2-small-x86"
  project          = "proj_id_here"
  site             = "SAO"
}
```

### Server with Inline Provisioner

```hcl
module "server" {
  source = "git::https://github.com/latitudesh/terraform-latitudesh-server-module.git"

  hostname         = "tf-module-server-inline"
  operating_system = "ubuntu_24_04_x64_lts"
  plan             = "c2-small-x86"
  project          = "proj_id_here"
  site             = "SAO"

  ssh_keys = ["ssh_id_here"]

  provisioners = {
    remote_exec = {
      inline = [
        "sudo apt update",
        "sudo apt install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx",
      ]
      connection = {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
      }
    }
  }
}
```

Another examples you can find in the [examples](examples) directory.

### Plan and Apply
```bash
terraform init
terraform plan
terraform apply
```

### Destroy the server
```bash
terraform destroy
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_latitudesh"></a> [latitudesh](#requirement\_latitudesh) | >= 2.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_latitudesh"></a> [latitudesh](#provider\_latitudesh) | >= 2.5.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [latitudesh_server.this](https://registry.terraform.io/providers/latitudesh/latitudesh/latest/docs/resources/server) | resource |
| [null_resource.local_exec](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.remote_exec_inline](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.remote_exec_script](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.remote_exec_scripts](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_reinstall"></a> [allow\_reinstall](#input\_allow\_reinstall) | [Optional] Allow server reinstallation when operating\_system, ssh\_keys, user\_data, raid, or ipxe changes. If false, only in-place updates are allowed. | `bool` | `null` | no |
| <a name="input_billing"></a> [billing](#input\_billing) | [Optional] The server billing type. Accepts hourly and monthly for on demand projects and yearly for reserved projects. | `string` | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | [Required] The server hostname. | `string` | n/a | yes |
| <a name="input_ipxe"></a> [ipxe](#input\_ipxe) | [Optional] URL where iPXE script is stored on, OR the iPXE script encoded in base64. This attribute is required when iPXE is selected as operating system. | `string` | `null` | no |
| <a name="input_locked"></a> [locked](#input\_locked) | [Optional] Lock/unlock the server. A locked server cannot be deleted or updated. | `bool` | `null` | no |
| <a name="input_operating_system"></a> [operating\_system](#input\_operating\_system) | [Required] The operating system slug for the new server | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | [Required] The plan slug to choose server from, defining the specs the server will have | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | [Required] The project (ID or Slug) to deploy the server | `string` | n/a | yes |
| <a name="input_provisioners"></a> [provisioners](#input\_provisioners) | [Optional] Configuration for provisioners (remote-exec, local-exec, file) | <pre>object({<br/>    remote_exec = optional(object({<br/>      inline  = optional(list(string))<br/>      script  = optional(string)<br/>      scripts = optional(list(string))<br/>      connection = object({<br/>        type        = string<br/>        host        = optional(string)<br/>        user        = optional(string)<br/>        password    = optional(string)<br/>        port        = optional(number)<br/>        timeout     = optional(string)<br/>        private_key = optional(string)<br/>      })<br/>    }))<br/>    local_exec = optional(object({<br/>      command     = string<br/>      working_dir = optional(string)<br/>      interpreter = optional(list(string))<br/>      environment = optional(map(string))<br/>    }))<br/>    file = optional(object({<br/>      source      = optional(string)<br/>      content     = optional(string)<br/>      destination = string<br/>      connection = object({<br/>        type        = string<br/>        host        = optional(string)<br/>        user        = optional(string)<br/>        password    = optional(string)<br/>        port        = optional(number)<br/>        timeout     = optional(string)<br/>        private_key = optional(string)<br/>      })<br/>    }))<br/>  })</pre> | `{}` | no |
| <a name="input_raid"></a> [raid](#input\_raid) | [Optional] RAID mode for the server. | `string` | `null` | no |
| <a name="input_site"></a> [site](#input\_site) | [Required] The site to deploy the server | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | [Optional] SSH Keys IDs to set on the server. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | [Optional] List of server tag IDs. | `list(string)` | `null` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | [Optional] User data ID to set on the server. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server"></a> [server](#output\_server) | The complete server resource object containing all attributes and computed values. |
| <a name="output_server_hostname"></a> [server\_hostname](#output\_server\_hostname) | The hostname assigned to the server during creation. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | The unique identifier assigned to the server. |
| <a name="output_server_ipv4"></a> [server\_ipv4](#output\_server\_ipv4) | The primary IPv4 address assigned to the server. |
| <a name="output_server_ipv6"></a> [server\_ipv6](#output\_server\_ipv6) | The primary IPv6 address assigned to the server. |
