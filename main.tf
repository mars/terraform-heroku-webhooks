
provider "heroku" {
  version = "~> 2.2"
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
