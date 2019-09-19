locals {
  reqinspeq_app_url = "https://${heroku_app.reqinspeq.name}.herokuapp.com"
}

resource "heroku_app" "reqinspeq" {
  name   = "tf-webhook-reqinspeq-${lower(random_id.unique_name.b64_url)}"
  region = var.heroku_common_region
}

resource "heroku_build" "reqinspeq" {
  app = heroku_app.reqinspeq.name

  source = {
    url = "https://github.com/mars/reqinspeq/archive/v1.2.0.tar.gz"
  }
}

resource "heroku_formation" "reqinspeq" {
  app        = heroku_app.reqinspeq.name
  type       = "web"
  quantity   = 1
  size       = var.heroku_common_dyno_size
  depends_on = [heroku_build.reqinspeq]
}

output "reqinspeq_app_name" {
  value = heroku_app.reqinspeq.name
}

output "reqinspeq_app_url" {
  value = local.reqinspeq_app_url
}

output "reqinspeq_app_build_log_url" {
  value = heroku_build.reqinspeq.output_stream_url
}
