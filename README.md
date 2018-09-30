# D2 ASSESSMENT NGINX SETUP ON GCP

## Pre-reqs
- GCP account
- Setup a project
- Setup an [service account](https://developers.google.com/identity/protocols/OAuth2ServiceAccount#creatinganaccount)
- Download the [JSON credentials](https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts) and add them here `assess-nginx/deployment/tf/secrets/account.json`
 
## Infrastructure Orchestration

### Technologies
- Terraform
- bash script
- Packer
- Ansible

## How to setup infrastructure and provision nginx

### Using: terraform and a shell script
- Navigate to the `assess-nginx/deployment/tf`
- Run `terraform init`
- Run `terraform plan` and if it looks good,
- Run `terraform apply`. Apply will use the script in `assess-nginx/deployment/tf/scripts/setup.sh` to install nginx.
- Use the `public-ip` that will display at the end of the apply process to view the nginx default page.

### Using: terraform, packer and bash
- Navigate to `assess-nginx/deployment/conf/packer/shell`
- Make sure to edit the `packer.json` to provide the correct `project_id` that corresponds to the service account json file you added in the pre-req step.
- Run `packer validate packer.json` to determine if the setup is correct.
- Run `packer build --force`
- This will generate an image called; `ubuntu-nginx-server-image`
- Navigate to the `tf` folder and run the following

```bash
terraform init -var="image_name=ubuntu-nginx-server-image"
terraform plan -var="image_name=ubuntu-nginx-server-image"
terraform apply -var="image_name=ubuntu-nginx-server-image"
```
- Use the public-ip output in a browser to view nginx default page.

### Using: terraform, packer and ansible
- Navigate to `assess-nginx/deployment/conf/packer/ansible`
- Follow the instruction in `Using: terraform, packer and bash`

### Using: terraform and ansible
- This last one is abit convoluted and I am still trying to make it work.