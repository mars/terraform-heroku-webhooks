
terraform {
  required_providers {
    heroku = {
      source = "heroku/heroku"
      version = "~> 4.5.1"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

variable "heroku_common_region" {
  default = "us"
}

variable "heroku_common_dyno_size" {
  default = "Standard-1x"
}

provider "random" {
  version = "~> 2.0"
}

resource "random_id" "unique_name" {
  byte_length = 4
}
