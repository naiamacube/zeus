terraform {
  backend "s3" {
    bucket  = "n3-zeus"
    key     = "n3-zeus-tfstate"
    encrypt = true
    dynamodb_table = "n3-zeus-tfstate"
  }
}
