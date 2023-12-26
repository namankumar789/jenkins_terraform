resource "aws_iam_role" "example_role" {
  name = var.rolename

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_role_policy" "sqs_policy" {
  name   = "sqs-policy"
  role   = aws_iam_role.example_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "sqs:SendMessage",
        Effect   = "Allow",
        Resource = var.sqs_id
      }
    ]
    
  })
}


variable "sqs_id" {
  description = "sqs_id"
  type        = string
}



resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.example_role.name
}

output "iamintanceprofilename" {
  value = aws_iam_instance_profile.test_profile.name
}

variable "rolename" {
  type = string
  
}









