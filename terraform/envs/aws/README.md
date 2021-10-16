# How to use it?

1. Create the `secrets.tfvars` according example.
2. Init terraform: `terraform init -backend-config=secrets.tfvars -upgrade=true`
3. Review changes: `terraform plan -var-file=secrets.tfvars`
4. Apply changes:`terraform apply -var-file=secrets.tfvars`
5. Print IPs: `terraform output output public_ips`
6. Check connection: `ssh -i path/to/key ec2-user@$(terraform output -raw public_ips)`
7. Ansible integration example:

```shell
ansible-playbook \
    -i "$(terraform output -raw public_ips) ," \
    some/path/playbook.yml
```
