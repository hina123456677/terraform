provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  for_each = var.s3_buckets

  bucket = each.value.bucket_name
  acl    = "private"

  tags = {
    Name        = each.key
    Environment = each.value.environment
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  for_each = {
    for k, v in var.s3_buckets : k => v
    if v.versioning
  }

  bucket = aws_s3_bucket.my_bucket[each.key].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  for_each = aws_s3_bucket.my_bucket

  bucket = each.value.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}