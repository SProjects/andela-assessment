variable "account_credentials" {
    description = "AWS access key"
    default = "./secrets/account.json"
}

variable "nginx_setup_file" {
    default = "./scripts/setup.sh"
}

variable "region" {
    type = "string"
    default = "us-central-1"
}

variable "project_id" {
    type = "string"
    default = "coral-hydra-166819"
}

variable "image_name" {
    type = "string"
    default = "ubuntu-1604-xenial-v20180912"
}