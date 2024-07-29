provider "aws" {
  region = "eu-west-1"
}
resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t3.micro"
  skip_final_snapshot = true
  db_name             = "example_database"

  username = var.db_username
  password = var.db_password
}

terraform {
    backend "s3" {
      # Replace this with your bucket name!
      bucket = "terraform-dani-bucket"
      key    = "stage/data-stores/mysql/terraform.tfstate"
      region = "eu-west-1"
      # Replace this with your DynamoDB table name!
      dynamodb_table = "terraform-up-and-running-locks"
      encrypt        = true
    }
  }
  