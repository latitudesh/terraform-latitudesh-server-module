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
  ipxe            = var.ipxe_url
  locked          = var.locked
  allow_reinstall = var.allow_reinstall
  raid            = var.raid
  ssh_keys        = var.ssh_keys
  tags            = var.tags
  user_data       = var.user_data
}

resource "null_resource" "remote_exec_inline" {
  count = try(var.provisioners.remote_exec.inline, null) != null ? 1 : 0

  triggers = {
    server_id = latitudesh_server.this.id
    server_ip = latitudesh_server.this.primary_ipv4
  }

  provisioner "remote-exec" {
    inline = var.provisioners.remote_exec.inline

    connection {
      type = var.provisioners.remote_exec.connection.type
      host = coalesce(
        try(var.provisioners.remote_exec.connection.host, null),
        latitudesh_server.this.primary_ipv4
      )
      user        = try(var.provisioners.remote_exec.connection.user, "ubuntu")
      password    = try(var.provisioners.remote_exec.connection.password, null)
      port        = try(var.provisioners.remote_exec.connection.port, null)
      timeout     = try(var.provisioners.remote_exec.connection.timeout, null)
      private_key = try(var.provisioners.remote_exec.connection.private_key, null)
    }
  }
}

resource "null_resource" "remote_exec_script" {
  count = try(var.provisioners.remote_exec.script, null) != null && try(var.provisioners.remote_exec.inline, null) == null ? 1 : 0

  triggers = {
    server_id = latitudesh_server.this.id
    server_ip = latitudesh_server.this.primary_ipv4
  }

  provisioner "remote-exec" {
    script = var.provisioners.remote_exec.script

    connection {
      type = var.provisioners.remote_exec.connection.type
      host = coalesce(
        try(var.provisioners.remote_exec.connection.host, null),
        latitudesh_server.this.primary_ipv4
      )
      user        = try(var.provisioners.remote_exec.connection.user, "ubuntu")
      password    = try(var.provisioners.remote_exec.connection.password, null)
      port        = try(var.provisioners.remote_exec.connection.port, null)
      timeout     = try(var.provisioners.remote_exec.connection.timeout, null)
      private_key = try(var.provisioners.remote_exec.connection.private_key, null)
    }
  }
}

resource "null_resource" "remote_exec_scripts" {
  count = try(var.provisioners.remote_exec.scripts, null) != null && try(var.provisioners.remote_exec.inline, null) == null && try(var.provisioners.remote_exec.script, null) == null ? 1 : 0

  triggers = {
    server_id = latitudesh_server.this.id
    server_ip = latitudesh_server.this.primary_ipv4
  }

  provisioner "remote-exec" {
    scripts = var.provisioners.remote_exec.scripts

    connection {
      type = var.provisioners.remote_exec.connection.type
      host = coalesce(
        try(var.provisioners.remote_exec.connection.host, null),
        latitudesh_server.this.primary_ipv4
      )
      user        = try(var.provisioners.remote_exec.connection.user, "ubuntu")
      password    = try(var.provisioners.remote_exec.connection.password, null)
      port        = try(var.provisioners.remote_exec.connection.port, null)
      timeout     = try(var.provisioners.remote_exec.connection.timeout, null)
      private_key = try(var.provisioners.remote_exec.connection.private_key, null)
    }
  }
}

resource "null_resource" "local_exec" {
  count = try(var.provisioners.local_exec, null) != null ? 1 : 0

  triggers = {
    server_id = latitudesh_server.this.id
  }

  provisioner "local-exec" {
    command     = var.provisioners.local_exec.command
    working_dir = try(var.provisioners.local_exec.working_dir, null)
    interpreter = try(var.provisioners.local_exec.interpreter, null)
    environment = try(var.provisioners.local_exec.environment, null)
  }
}