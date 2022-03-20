terraform {
  required_providers {
   aws = {
      source = "hashicorp/aws"
     # version = "3.58.0"
    } 
  }  
}
provider "aws" {
    profile = "default"
    region = "ap-south-1"
}
variable "instance_type" {
    type = string
}
locals {
  project_name = "balaram" 
}
resource "aws_instance" "mynewserver" {
  //lifecycle {
  //ignore_changes = [instance_type]
  //prevent_destroy = true
//}
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type

    tags = {
      "Name" = "mynewserver-${local.project_name}"
    }
}
/*module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tf-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  #enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}*/
/*output "public_ip" {
    value = aws_instance.mynewserver.public_ip
  
}*/
