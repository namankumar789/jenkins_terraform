provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIASWHUKD3J7JO53BRD"
  secret_key = "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"
} 


variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 1
}

variable "nameofsqs" {
  description = "name of sqs"
  type= string
  default = "naman"
}

module "ec2module" {
  source = "./module1"
  instancecount= var.instance_count
  iamintance_profilename  = module.iammodule.iamintanceprofilename

}

module "sqs-module" {
  source = "./modlue2"
  namee =var.nameofsqs
}

variable "rolename1" {
  type = string
  
}

module "iammodule" {
  source = "./module3"
  sqs_id = module.sqs-module.aws-arn
 rolename = var.rolename1
}



