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
variable "vpc_cidr" {
 description = "allocating cidr to vpc"
 default = "10.50.0.0/16" 
}
variable "subnet_cidr" {
 description = "allocating cidr to tata-subnet"
 default = "10.50.1.0/24"
}
variable "route_cidr" {
 description = "path for traffic"
 default = "0.0.0.0/0"
}
variable "security_grp_cidr" {
 description = "specifying which  traffic to be allowed inside"
 default = ["0.0.0.0/0"]   
}
variable "ami_id" {
 description = "allocating amazone machine image id"
 default = "ami-0b37e9efc396e4c38"
}
terraform {
 required_version = ">= 0.9.0"
 backend "s3" {
 bucket = "terraform-storage-statefiles-f3"
 key = "myapp/dev/terrafor.tfstatefile"
 profile = "terraform.provisioner"
 region = "us-east-2"
}
}
 
