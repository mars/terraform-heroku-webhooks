locals {
  example_app_url = "https://${heroku_app.example.name}.herokuapp.com"
}

resource "heroku_app" "example" {
  name   = "tf-webhook-example-${lower(random_id.unique_name.b64_url)}"
  region = var.heroku_common_region
}

resource "heroku_build" "example" {
  app = heroku_app.example.name

  source {
    path = "app/"
  }
}

resource "heroku_formation" "example" {
  app        = heroku_app.example.name
  type       = "web"
  quantity   = 1
  size       = var.heroku_common_dyno_size
  depends_on = [heroku_build.example]
}

output "example_app_name" {
  value = heroku_app.example.name
}

output "example_app_url" {
  value = local.example_app_url
}

output "example_app_build_log_url" {
  value = heroku_build.example.output_stream_url
}
