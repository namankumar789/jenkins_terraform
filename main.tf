provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIASWHUKD3J7JO53BRD"
  secret_key = "cb8wQ3V8y9SaYKhjZN3T7J2heHPIfQcJq+OQoytG"
} 


# Create an SQS FIFO Queue
resource "aws_sqs_queue" "example_queue" {
  name                      = "example-queue.fifo"
  fifo_queue                = true
  content_based_deduplication = true
  message_retention_seconds = 345600  
}

