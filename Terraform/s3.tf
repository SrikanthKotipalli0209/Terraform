resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-s3-flm-mybucket67"
  tags = {
    Name = "Terrafomr-bucket"
  }
}
resource "aws_s3_bucket_versioning" "aws_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
