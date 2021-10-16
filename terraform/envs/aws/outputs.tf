output "public_ips" {
  value = join(", ",module.gitlab_runner.public_ips)
}
