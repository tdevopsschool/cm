# Readme

```bash
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
sudo pip3 install --user boto3

ansible-inventory  -i sandbox_aws_ec2.yml --graph
ansible  -u ec2-user -i sandbox_aws_ec2.yml -m ping all
ansible-playbook -u ec2-user -i sandbox_aws_ec2.yml install_gitlab_runner_demo_1.yml
```

```bash
ansible-playbook \
    -i "$(terraform output -raw public_ip)" \
    some/path/playbook.yml
```

## If you use MFA for your account you need to do following

- [Get session token](https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/?nc1=h_ls>):

```bash

AWS_ACCESS_KEY_ID="KEY_ID" \
AWS_SECRET_ACCESS_KEY="ACCESS_KEY" \
AWS_SESSION_TOKEN="" \
aws sts get-session-token --serial-number arn-of-the-mfa-device --token-code code-from-token
 --region=eu-central-1
```

- Add token outputs to variables:

```bash
export AWS_ACCESS_KEY_ID=example-key-id-as-in-previous-output
export AWS_SECRET_ACCESS_KEY=example-access-key-as-in-previous-output
export AWS_SESSION_TOKEN=example-session-token-as-in-previous-output
```

  OR

- Add outputs to terraform.tfvars:

```hcl
session_token = "..."
access_key = "..."
secret_key = "..."

```