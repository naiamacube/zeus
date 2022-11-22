terraform {
  backend "s3" {
    bucket  = "n3-zeus"
    key     = "n3-zeus-tfstate"
    region  = var.aws_region
    encrypt = true
    
    access_key = var.aws_access_key_id
    secret_key = var.aws_secret_access_key

    dynamodb_table = "n3-zeus-tfstate"
  }
}
