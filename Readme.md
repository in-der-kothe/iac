# Setting up your own nextcloud instance in the hetzner cloud

## Features

* Fully automated setup with [Terraform](https://www.terraform.io/) and [Ansible](https://www.redhat.com/en/ansible-collaborative?intcmp=7015Y000003t7aWQAQ)
* Nextcloud (collaborative) Office with own [Collabora](https://www.collaboraonline.com/) Server instance
* Sending out Mails
* Https with letsencrypt
* File Storage on cheap S3 Storage

# Detailed Documentation

Read out my Blog articel for a detailed description about this setup

## Prerequisites

* You have an hetzner cloud account
* You have a domain name that you can controll with hetzner
* You have an smtp server to send mails (ideally with hetzner)
* You have terraform installed on your laptop

## How to start

`python -m venv venv`

`source ./venv/bin/activate`

`pip install -r requirements.txt`

`terrraform apply`

`ssh root@in-der-kothe.de`

`ansible-playbook ne`