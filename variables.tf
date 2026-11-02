variable "vcd_url" { type = string }
variable "vcd_org" { type = string }
variable "vcd_vdc" { type = string }
variable "vcd_user" { type = string }
variable "vcd_password" {
  type      = string
  sensitive = true
}
variable "vcd_allow_unverified_ssl" {
  type    = bool
  default = false
}

variable "catalog_name" { type = string }
variable "template_name" { type = string }
variable "network_name" { type = string } # existing org VDC network

variable "vms" {
  description = "Machines to create. Omit ip to take one from the network's static pool."
  type = map(object({
    cpus   = number
    memory = number # MB
    ip     = optional(string)
  }))
}
