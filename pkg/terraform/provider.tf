provider "local" {}

terraform {
  backend "s3" {
    key     = "choclab-nebula.tfstate"
    encrypt = true
  }
}

