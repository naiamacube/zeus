terraform {
  backend "s3" {
    bucket         = "n3-zeus-tfstate"
    key            = "zeus.tfstate"
    encrypt        = true

    dynamodb_table = "n3-zeus-tfstate"
  }
}
