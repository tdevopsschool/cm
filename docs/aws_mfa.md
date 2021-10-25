# MFA & AWS

If you use MFA for your account you need to do following

## [1. Get session token](https://aws.amazon.com/premiumsupport/knowledge-center/authenticate-mfa-cli/?nc1=h_ls>):

```bash

AWS_DEFAULT_REGION="eu-central-1" \
AWS_ACCESS_KEY_ID="KEY_ID" \
AWS_SECRET_ACCESS_KEY="ACCESS_KEY" \
AWS_SESSION_TOKEN="" \
aws sts get-session-token \
  --serial-number arn-of-the-mfa-device \
  --token-code code-from-token \
  --region=eu-central-1
```

## 2. Add token outputs to environment variables

```bash
export AWS_DEFAULT_REGION="eu-central-1"
export AWS_ACCESS_KEY_ID=example-key-id-as-in-previous-output
export AWS_SECRET_ACCESS_KEY=example-access-key-as-in-previous-output
export AWS_SESSION_TOKEN=example-session-token-as-in-previous-output
```

Usually, application supports passing the creds via config file. In case of terraform outputs to terraform.tfvars:

```hcl
access_key = "example-access-key-as-in-previous-output"
secret_key = "example-key-id-as-in-previous-output"
token = "example-session-token-as-in-previous-output"
```

or set in ansible dynamic inventory:

```yaml
plugin: amazon.aws.aws_ec2
aws_access_key: example-access-key-as-in-previous-output
aws_secret_key: example-key-id-as-in-previous-output
aws_security_token: example-session-token-as-in-previous-output
```
