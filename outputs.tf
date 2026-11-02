output "vm_ips" {
  value = { for name, vm in vcd_vm.vm : name => vm.network[0].ip }
}
