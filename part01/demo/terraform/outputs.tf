output "instances_ip"{
  value = "${join(", ", flatten(vra7_deployment.playground[*].resource_configuration[*].instances[*].ip_address))}, "
}
