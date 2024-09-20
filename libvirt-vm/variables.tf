variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 1
}

variable "vm_name" {
  description = "Base name for the VMs"
  type        = string
}

variable "vm_memory" {
  description = "Amount of memory for the VM in MB"
  type        = number
  default     = 1024
}

variable "vm_vcpu" {
  description = "Number of vCPUs for the VM"
  type        = number
  default     = 1
}

variable "disk_sizes" {
  description = "List of disk sizes in GB (one or more)"
  type        = list(number)
  default     = [10]
}

variable "network_interfaces" {
  description = "List of network interfaces"
  type        = list(map(string))
  default     = []
}

variable "storage_pool_name" {
  description = "Name of the storage pool"
  type        = string
  default     = "default-pool"
}

variable "storage_pool_path" {
  description = "Path to the storage pool directory"
  type        = string
  default     = "/var/lib/libvirt/images"
}

variable "image_path" {
  description = "Path to the QCOW2 image file"
  type        = string
}

