provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  for_each = var.s3_buckets

  bucket = each.value.bucket_name
  acl    = each.value.acl

  tags = {
    Name        = each.key
    Environment = each.value.environment
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
    prevent_destroy = true
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

   # Look up from the variable, not from the bucket resource
  block_public_acls       = var.s3_buckets[each.key].block_public.block_public_acls
  block_public_policy     = var.s3_buckets[each.key].block_public.block_public_policy
  ignore_public_acls      = var.s3_buckets[each.key].block_public.ignore_public_acls
  restrict_public_buckets = var.s3_buckets[each.key].block_public.restrict_public_buckets

}

