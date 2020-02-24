terraform {
  backend "s3" {
    bucket         = "lf.rnd.storage"
    region         = "us-east-2"
    dynamodb_table = "terraform_locks"
  }
}