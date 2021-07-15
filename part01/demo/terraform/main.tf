terraform {
  required_providers {
    vra7 = {
      source = "vmware/vra7"
      version = "2.0.0"
    }
  }
}

provider "vra7" {
  username = var.vclod_username
  password = var.vcloud_password
  tenant   = var.vcloud_tenant
  host     = var.vcloud_host
  insecure = "true"
}

resource "vra7_deployment" "playground" {
  count = 1
  catalog_item_name = "CentOS 7 1908"
  lease_days = 10
  reasons = "Create test playgorund. Created by terraform"
  businessgroup_name = "DevOps School"

  resource_configuration  {
      component_name = "centos7"
      configuration = {
            "root.password" = var.root_password
        }
    }
}