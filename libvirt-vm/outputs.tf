output "vm_names" {
  value = [for instance in libvirt_domain.vm_instance : instance.name]
}

output "vm_ips" {
  value = [
    for instance in libvirt_domain.vm_instance : (
      length(instance.network_interface) > 0
        ? length(instance.network_interface[0].addresses) > 0
          ? instance.network_interface[0].addresses
          : ["No IP Assigned"]
        : ["No Network Interface"]
    )
  ]
}

output "network_interfaces_debug" {
  value = [for instance in libvirt_domain.vm_instance : instance.network_interface]
}

