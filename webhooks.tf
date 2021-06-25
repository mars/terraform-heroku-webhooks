resource "heroku_app_webhook" "example_release" {
  app_id  = heroku_app.example.id
  level   = "sync"
  url     = local.reqinspeq_app_url
  include = ["api:release"]
}
