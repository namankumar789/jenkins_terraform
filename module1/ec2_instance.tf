

resource "aws_instance" "example" {
  ami           = "ami-02a2af70a66af6dfb"
  instance_type = "t2.micro"
  iam_instance_profile = var.iamintance_profilename
  count = var.instancecount
}


variable "instancecount" {
  description = "EC2 instance count"
  type        = number
  default = 1
  
}




variable "iamintance_profilename" {
  type = string
  
  
}














