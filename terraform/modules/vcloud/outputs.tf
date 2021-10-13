output "instances_ip"{
  value = flatten(vra7_deployment.playground[*].resource_configuration[*].instances[*].ip_address)
}
