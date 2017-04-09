terraform {
  backend "s3" {
    bucket  = "spark-tfstate"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = "true"
  }
}
