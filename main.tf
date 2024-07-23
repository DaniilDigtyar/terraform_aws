provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c6d91e4a58c413a9"
  instance_type = "t2.micro"
}

