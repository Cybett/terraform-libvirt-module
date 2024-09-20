provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "vm_storage_pool" {
  name = "terraform-storage-pool-20240917"  # Ensure this is a unique name
  type = "dir"
  path = "/var/lib/libvirt/images/terraform-storage-pool-20240917"
}

resource "libvirt_volume" "vm_disks" {
  count   = length(var.disk_sizes)
  name    = "${var.vm_name}-${count.index}-disk${count.index}"
  pool    = libvirt_pool.vm_storage_pool.name
  size    = var.disk_sizes[count.index] * 1024 * 1024 * 1024
  format  = "qcow2"
}

resource "libvirt_domain" "vm_instance" {
  count  = var.vm_count
  name   = "${var.vm_name}-${count.index}"

  memory  = var.vm_memory
  vcpu    = var.vm_vcpu

  disk {
    volume_id = libvirt_volume.vm_disks[count.index].id
  }

  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      network_name = network_interface.value["name"]
    }
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  graphics {
    type = "spice"
  }
}

