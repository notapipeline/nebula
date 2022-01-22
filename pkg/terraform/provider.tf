provider "local" {}

terraform {
  required_providers {
    vagrant = {
      source  = "bmatcuk/vagrant"
      version = "~> 4.0.0"
    }
  }

  backend "s3" {
    key     = "choclab-nebula.tfstate"
    encrypt = true
  }
}

