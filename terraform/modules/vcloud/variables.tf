variable "catalog_item_name" {
  default = "CentOS 7 1908"
  description = "The VM template name"
}

variable "vclod_username" {
  description = "Username for connection to vcloud"
}

variable "vcloud_password" {
  description = "Password for connection to vcloud"
}

variable "vcloud_tenant" {
  default = "vsphere.local"
  description = "Password for connection to vcloud"
}

variable "vcloud_host" {
  description = "Vcloud host"
}

variable "root_password" {
  description = "Root password for created VM"
}

variable "instances_count" {
  default = 1
  description = "The amount of instances to create"
}

variable "businessgroup_name" {
  default = "DevOps School"
  description = "The name of business group for creating VMs"
}

variable "lease_days" {
  default = 14
  description = "Number of lease days remaining for the deployment"
}

variable "reasons" {
  default = "Create test playgorund. Created by terraform"
  description = "Reasons for requesting the deployment"
}
