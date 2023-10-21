#!/bin/bash
yum install python3.11-devel python3.11-pip -y
pip3.11 install ansible botocore boto3
cd /tmp
# git clone https://github.com/Chinna9967/roboshop-shell-tf-master.git
# cd roboshop-shell-tf-master
# sh mongodb.sh
ansible-pull -U https://github.com/Chinna9967/ansible-roboshop-roles-master-tf.git -e component=mongodb main.yaml

# now we are using ansible