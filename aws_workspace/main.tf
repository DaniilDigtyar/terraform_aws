provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c6d91e4a58c413a9"
  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"
}


terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "terraform-dani-bucket"
    key    = "workspaces-example/terraform.tfstate"
    region = "eu-west-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}