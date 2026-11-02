terraform {
  required_version = ">= 1.3"
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = "~> 3.14"
    }
  }
}

provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_password
  auth_type            = "integrated"
  org                  = var.vcd_org
  vdc                  = var.vcd_vdc
  url                  = var.vcd_url
  allow_unverified_ssl = var.vcd_allow_unverified_ssl
  max_retry_timeout    = 120
}
