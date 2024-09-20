module "libvirt_vms" {
  source            = "./modules/libvirt-vm"
  vm_count          = 1
  vm_name           = "test-vm"
  vm_memory         = 4096
  vm_vcpu           = 2
  disk_sizes        = [20]  # For one disk
  network_interfaces = [
    { name = "default", mode = "bridge" },
    { name = "private", mode = "nat" }
  ]
  storage_pool_name = "terraform-storage-pool-20240918"  # Updated to a unique name
  storage_pool_path = "/var/lib/libvirt/images/terraform-storage-pool-20240918"  # Updated path to match the new name
  image_path        = "/home/chiloba/focal-server-cloudimg-amd64.img"
}

