# Required variables
variable "hostname" {
  type        = string
  description = "[Required] The server hostname."

  validation {
    condition     = length(var.hostname) <= 32
    error_message = "Hostname must be less than 32 characters."
  }
}

variable "operating_system" {
  type        = string
  description = "[Required] The operating system slug for the new server"

  validation {
    condition = contains([
      "ipxe",
      "windows_server_2019_std_v1",
      "ubuntu_22_04_x64_lts",
      "debian_11",
      "debian_10",
      "rhel8",
      "windows_server_2012_r2_std_v28",
      "windows_server_2012_r2_dc_v5",
      "esxi_6_7",
      "debian_9_4_x64",
      "centos_7_4_x64",
      "centos_8_x64",
      "ubuntu_16_04_x64_lts",
      "ubuntu_20_04_x64_lts",
      "windows_server_2016_std_v1",
      "windows_server_2016_dc_v1",
      "windows_server_2019_dc_v1",
      "debian_12",
      "ubuntu22_ml_in_a_box",
      "ubuntu_18_04_x64_lts",
      "windows_server_2019_std_uefi",
      "windows_2022_std_uefi",
      "windows_2022_std",
      "ubuntu_24_04_x64_lts",
      "rockylinux_8",
    ], var.operating_system)
    error_message = "Operating system must be one of: ipxe, windows_server_2019_std_v1, ubuntu_22_04_x64_lts, debian_11, debian_10, rhel8, windows_server_2012_r2_std_v28, windows_server_2012_r2_dc_v5, esxi_6_7, debian_9_4_x64, centos_7_4_x64, centos_8_x64, ubuntu_16_04_x64_lts, ubuntu_20_04_x64_lts, windows_server_2016_std_v1, windows_server_2016_dc_v1, windows_server_2019_dc_v1, debian_12, ubuntu22_ml_in_a_box, ubuntu_18_04_x64_lts, windows_server_2019_std_uefi, windows_2022_std_uefi, windows_2022_std, ubuntu_24_04_x64_lts, rockylinux_8."
  }
}

variable "plan" {
  type        = string
  description = "[Required] The plan slug to choose server from, defining the specs the server will have"

  validation {
    condition = contains([
      "c2-large-x86",
      "c2-medium-x86",
      "c2-small-x86",
      "c3-large-x86",
      "c3-medium-x86",
      "c3-small-x86",
      "c3-xlarge-x86",
      "g3-large-x86",
      "g3-medium-x86",
      "g3-small-x86",
      "g3-xlarge-x86",
      "m3-large-x86",
      "s2-small-x86",
      "s3-large-x86",
    ], var.plan)
    error_message = "Plan must be one of: c2-large-x86, c2-medium-x86, c2-small-x86, c3-large-x86, c3-medium-x86, c3-small-x86, c3-xlarge-x86, g3-large-x86, g3-medium-x86, g3-small-x86, g3-xlarge-x86, m3-large-x86, s2-small-x86, s3-large-x86."
  }
}

variable "project" {
  type        = string
  description = "[Required] The project (ID or Slug) to deploy the server"

  validation {
    condition     = can(regex("^proj_[A-Za-z0-9]{13}$", var.project))
    error_message = "Project must follow the pattern 'proj_' followed by exactly 13 alphanumeric characters (e.g., proj_A05EdQ50dvKYQ)."
  }
}

variable "site" {
  type        = string
  description = "[Required] The site to deploy the server"

  validation {
    condition = contains([
      "AMS",
      "ASH",
      "BGT",
      "BUE",
      "CHI",
      "DAL",
      "FRA",
      "LAX",
      "LON",
      "MEX",
      "MEX2",
      "MIA",
      "MIA2",
      "NYC",
      "SAN",
      "SAO",
      "SAO2",
      "SYD",
      "TYO",
      "TYO2"
    ], var.site)
    error_message = "Site must be one of: AMS, ASH, BGT, BUE, CHI, DAL, FRA, LAX, LON, MEX, MEX2, MIA, MIA2, NYC, SAN, SAO, SAO2, SYD, TYO, TYO2."
  }
}

# Optional variables
variable "allow_reinstall" {
  type        = bool
  description = "[Optional] Allow server reinstallation when operating_system, ssh_keys, user_data, raid, or ipxe changes. If false, only in-place updates are allowed."
  default     = null
}

variable "billing" {
  type        = string
  description = "[Optional] The server billing type. Accepts hourly and monthly for on demand projects and yearly for reserved projects."
  default     = null

  validation {
    condition     = var.billing == null || contains(["hourly", "monthly", "yearly"], var.billing)
    error_message = "Billing type must be one of: hourly, monthly, yearly."
  }
}

variable "ipxe" {
  type        = string
  description = "[Optional] URL where iPXE script is stored on, OR the iPXE script encoded in base64. This attribute is required when iPXE is selected as operating system."
  default     = null
}

variable "locked" {
  type        = bool
  description = "[Optional] Lock/unlock the server. A locked server cannot be deleted or updated."
  default     = null

  validation {
    condition     = var.locked == null || var.locked == true || var.locked == false
    error_message = "Locked must be a boolean value."
  }
}

variable "raid" {
  type        = string
  description = "[Optional] RAID mode for the server."
  default     = null

  validation {
    condition     = var.raid == null || var.raid == "raid-0" || var.raid == "raid-1"
    error_message = "RAID must be one of: raid-0, raid-1."
  }
}

variable "ssh_keys" {
  type        = list(string)
  description = "[Optional] SSH Keys IDs to set on the server."
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "[Optional] List of server tag IDs."
  default     = null
}

variable "user_data" {
  type        = string
  description = "[Optional] User data ID to set on the server."
  default     = null
}

# Provisioner variables
variable "provisioners" {
  type = object({
    remote_exec = optional(object({
      inline  = optional(list(string))
      script  = optional(string)
      scripts = optional(list(string))
      connection = object({
        type        = string
        host        = optional(string)
        user        = optional(string)
        password    = optional(string)
        port        = optional(number)
        timeout     = optional(string)
        private_key = optional(string)
      })
    }))
    local_exec = optional(object({
      command     = string
      working_dir = optional(string)
      interpreter = optional(list(string))
      environment = optional(map(string))
    }))
    file = optional(object({
      source      = optional(string)
      content     = optional(string)
      destination = string
      connection = object({
        type        = string
        host        = optional(string)
        user        = optional(string)
        password    = optional(string)
        port        = optional(number)
        timeout     = optional(string)
        private_key = optional(string)
      })
    }))
  })
  description = "[Optional] Configuration for provisioners (remote-exec, local-exec, file)"
  default     = {}
}