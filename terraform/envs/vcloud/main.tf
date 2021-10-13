module "vcloud" {
  source = "../../modules/vcloud"
  vclod_username = var.vclod_username
  vcloud_password = var.vcloud_password
  vcloud_host = var.vcloud_host
  root_password = var.root_password
  instances_count = 1
  lease_days = 7
}
