# How to use it?



1. Create the `secrets.tfvars` according example
2. Init terraform

```shell
terraform init -backend-config=secrets.tfvars -upgrade=true
```

3. Review changes

```shell
terraform plan -var-file=secrets.tfvars
```

4. Apply changes

```shell
terraform apply -var-file=secrets.tfvars
```