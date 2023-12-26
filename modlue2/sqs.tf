resource "aws_sqs_queue" "example_queue" {
  name = var.namee

  tags = {
    Name = "naman"
  }
}

variable "namee" {
  description = "nameofsqs"
  type= string
  default = "naman"
}

output "aws-arn" {
  value = aws_sqs_queue.example_queue.arn
}






