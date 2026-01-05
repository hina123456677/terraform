s3_buckets = {
  dev = {
    bucket_name = "hina-dev-bucket-123"
    environment = "Dev"
    versioning  = true
    acl         = "private"
    block_public = {
      block_public_acls       = true
      block_public_policy     = true
      ignore_public_acls      = true
      restrict_public_buckets = true
    }
  }

  prod = {
    bucket_name = "hina-prod-bucket-123"
    environment = "Prod"
    versioning  = true
    acl         = "private"
    block_public = {
      block_public_acls       = true
      block_public_policy     = true
      ignore_public_acls      = true
      restrict_public_buckets = true
    }
  }
}