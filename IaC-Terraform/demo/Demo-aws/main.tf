# Configure the AWS Provider.
provider "aws" {
  region = "us-east-2"
  access_key = "<Your key here>"
  secret_key = "<Your secret here>"
}

# Create WebApp
resource "aws_instance" "demo-learning" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}