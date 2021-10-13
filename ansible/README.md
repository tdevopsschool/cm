# Prepare host

```bash
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
sudo pip3 install --user boto3
```

## check the dynamic inventory

```bash
ansible-inventory  -i sandbox_aws_ec2.yml --graph
ansible -u ec2-user -i sandbox_aws_ec2.yml -m ping all

```

## Install gitlab runeer

```bash
ansible-playbook \
    -vvv \
    -e "gitlab_runner_registration_token=hgFYckg7S_GLiqsJoqcT" \
    -u ec2-user \
    -i ~/cm/ansible/sandbox_aws_ec2.yml \
    ~/cm/ansible/install_gitlab_runner.yml
```
