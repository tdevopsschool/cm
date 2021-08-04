FROM centos:7.8.2003

COPY part01 /home/ansible

RUN yum install -y epel-release

RUN yum install -y ansible

WORKDIR /home/ansible
