resource "aws_s3_bucket" "fried" {
  bucket_prefix = "jenkins-fried-chicken-bucket-"
  force_destroy = true

  tags = {
    Name = "Jenkins Fried Chicken Bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "fried" {
  bucket = aws_s3_bucket.fried.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "fried" {
  bucket = aws_s3_bucket.fried.id

  depends_on = [aws_s3_bucket_public_access_block.fried]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.fried.arn}/*"
      }
    ]
  })
}

output "bucket_name" {
  value = aws_s3_bucket.fried.id
}