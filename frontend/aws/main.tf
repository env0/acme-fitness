resource "random_string" "random" {
  length  = 10
  special = false
  lower   = true
  upper   = false
  number  = true
  keepers = {"index.html":"${filemd5("index.html")}"}
}

module "s3" {
  source  = "../../modules/s3"
  bucketname = "acme-frontend-${random_string.random.id}"
}
