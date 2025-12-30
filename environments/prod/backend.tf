terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket1122"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
