s3_buckets = {
  dev_bucket = {
    bucket_name = "hina-dev-private-bucket-123"
    environment = "Dev"
    versioning  = true
  }

  prod_bucket = {
    bucket_name = "hina-prod-private-bucket-123"
    environment = "Prod"
    versioning  = true
  }
}