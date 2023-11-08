# Execute Terraform

## fill and expose secrets
open `secrets.txt` and fill out the corresponding values
to prevent secrets from leaking ignore any further changes to the tracked file `git update-index --assume-unchanged ./kubernetes/terraform/secrets.txt` or use the ignored filed name "secrets_filled.txt" to avoid committing secrets to the repository.

copy and execute the commands in your terminal or wsl terminal (on windows)
## download and install terraform 
follow the instruction at https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
to install the terraform client on your pc or into the wsl

## initialize the project
call `terraform init`

## deploy the machines
call `terraform apply`

## tear down the deployment
call `terraform destroy`