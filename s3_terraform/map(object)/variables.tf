variable "region" {
  type    = string
  default = "us-east-1"
}

variable "s3_buckets" {
  description = "Map of S3 bucket configurations"
  type = map(object({
    bucket_name = string
    environment = string
    versioning  = bool
    acl         = string
     block_public = object({
      block_public_acls       = bool
      block_public_policy     = bool
      ignore_public_acls      = bool
      restrict_public_buckets = bool
    })
  }))
}