resource "aws_iam_access_key" "test_user_key" {
  user = aws_iam_user.test_user.name
}