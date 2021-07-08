output "instances_ip"{
  value = join(", ", module.vcloud.instances_ip)
}

resource "local_file" "ansible_inventory" {
  content     = templatefile("ansible_inventory_template.yml", { instances_ip=module.vcloud.instances_ip})
  filename    = var.ansible_inventory
}