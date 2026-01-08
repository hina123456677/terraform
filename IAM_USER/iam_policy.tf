resource "aws_iam_policy" "s3_upload_only" {
  name = "s3-upload-only-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject"
        ]
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.test_user.name
  policy_arn = aws_iam_policy.s3_upload_only.arn
}