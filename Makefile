SHELL := /bin/bash

init-dev:
    cd environments/dev && terraform init

plan-dev:
    cd environments/dev && terraform plan -var-file=../../terraform.tfvars.example

apply-dev:
    cd environments/dev && terraform apply -var-file=../../terraform.tfvars.example

init-prod:
    cd environments/prod && terraform init

plan-prod:
    cd environments/prod && terraform plan -var-file=../../terraform.tfvars.example

apply-prod:
    cd environments/prod && terraform apply -var-file=../../terraform.tfvars.example
