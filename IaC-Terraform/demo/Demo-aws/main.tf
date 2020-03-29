# Configure the AWS Provider.
provider "aws" {
  region = "us-east-2"
  access_key = "AKIA4NK63CVB5JOZ3BOB"
  secret_key = "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"
}

# Create WebApp
resource "aws_instance" "demo-learning" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}