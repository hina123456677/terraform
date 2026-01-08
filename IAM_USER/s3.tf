resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "TestBucket"
  }
}  