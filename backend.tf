terraform {
  backend "s3" {
    #these resources exist in devsecops
    bucket = "kian-intern-teaching-state-bucket"
    key = "team_lucky/lee/first_terraform/terraform.tfstate"
    region = "ap-southeast-2"
    dynamodb_table = "terraform-locks"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}