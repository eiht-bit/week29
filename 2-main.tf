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

resource "aws_s3_object" "ethiopian_women" {
  bucket       = aws_s3_bucket.fried.id
  key          = "ethiopian_women.png"
  source       = "ethiopian_women.png"
  content_type = "image/png"
}

resource "aws_s3_object" "i_love_ethiopian_women" {
  bucket       = aws_s3_bucket.fried.id
  key          = "i_love_ethiopian_women.txt"
  source       = "i_love_ethiopian_women.txt"
  content_type = "text/plain"
}

resource "aws_s3_object" "armageddon_proof" {
  bucket       = aws_s3_bucket.fried.id
  key          = "armageddon_proof.txt"
  source       = "armageddon_proof.txt"
  content_type = "text/plain"
}

resource "aws_s3_object" "screenshot_1" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_1.png"
  source       = "Screenshot_1.png"
  content_type = "image/png"
}

resource "aws_s3_object" "screenshot_2" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_2.png"
  source       = "Screenshot_2.png"
  content_type = "image/png"
}

resource "aws_s3_object" "screenshot_3" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_3.png"
  source       = "Screenshot_3.png"
  content_type = "image/png"
}

resource "aws_s3_object" "screenshot_4" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_4.png"
  source       = "Screenshot_4.png"
  content_type = "image/png"
}

resource "aws_s3_object" "screenshot_5" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_5.png"
  source       = "Screenshot_5.png"
  content_type = "image/png"
}

resource "aws_s3_object" "screenshot_6" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_6.png"
  source       = "Screenshot_6.png"
  content_type = "image/png"
}

resource "aws_s3_object" "screenshot_7" {
  bucket       = aws_s3_bucket.fried.id
  key          = "Screenshot_7.png"
  source       = "Screenshot_7.png"
  content_type = "image/png"
}

output "bucket_name" {
  value = aws_s3_bucket.fried.id
}