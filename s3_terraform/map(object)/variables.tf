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
  }))
}