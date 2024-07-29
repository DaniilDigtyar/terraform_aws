provider "aws" {
  region = "eu-west-1"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-dani-bucket"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 2
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "terraform-dani-bucket"
    key    = "stage/services/webserver-cluster/terraform.tfstate"
    region = "eu-west-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
