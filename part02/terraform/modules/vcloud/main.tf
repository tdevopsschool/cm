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
  count = var.instances_count
  catalog_item_name = var.catalog_item_name
  lease_days = var.lease_days
  businessgroup_name = var.businessgroup_name

  resource_configuration  {
      component_name = "centos7"
      configuration = {
            "root.password" = var.root_password
        }
    }
}
