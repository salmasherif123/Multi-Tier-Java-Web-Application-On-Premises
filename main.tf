# 1. Look up the template to clone from
data "vcd_catalog" "lib" {
  name = var.catalog_name
}

data "vcd_catalog_vapp_template" "tpl" {
  catalog_id = data.vcd_catalog.lib.id
  name       = var.template_name
}

# 4. One VM per entry in var.vms
resource "vcd_vm" "vm" {
  for_each = var.vms

  name             = each.key
  computer_name    = each.key
  vapp_template_id = data.vcd_catalog_vapp_template.tpl.id

  cpus      = each.value.cpus
  cpu_cores = 1
  memory    = each.value.memory

  network {
    type               = "org"
    name               = var.network_name
    ip_allocation_mode = each.value.ip == null ? "POOL" : "MANUAL"
    ip                 = each.value.ip
    is_primary         = true
  }

  customization {
    enabled = true # guest customization sets hostname and IP
  }

  power_on = true
}