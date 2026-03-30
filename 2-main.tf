resource "aws_s3_bucket" "fried" {
  bucket_prefix = "jenkins-fried-chicken-bucket-"
  force_destroy = true

  tags = {
    Name = "Jenkins Fried Chicken Bucket"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.fried.id
}