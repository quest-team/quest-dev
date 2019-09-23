 variable "aws_key_name" {}
 variable "aws_key_path" {}
 variable "profile" {
 description = "aws commandline user profile"
 default = "terraform.provisioner"
} 
 variable "aws_region" {
 description = "region for ec2 instance"
 default = " us-west-2"
}
terraform {
 backend "s3" {
 bucket = "terraform-storage-statefiles-f3"
 key = "myapp/dev/terrafor.tfstatefile"
 profile = "terraform.provisioner"
 region = "us-east-2"
}
}
 
