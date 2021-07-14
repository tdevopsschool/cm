#!/bin/bash

cat >>/etc/yum.repos.d/gitlab-runner.repo <<EOL
[gitlab-runner]
baseurl = https://packages.gitlab.com/runner/gitlab-runner/el/7/\$basearch
gpgcheck = 0
EOL

yum -y install gitlab-runner

cat >>/etc/gitlab-runner/config.toml <<EOL
concurrent = 1
[[runners]]
  name = "shell executor runner"
  executor = "shell"
  shell = "bash"
EOL

systemctl restart gitlab-runner.service
systemctl status gitlab-runner.service