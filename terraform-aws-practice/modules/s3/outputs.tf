output "bucket_name" {
  description = "s3 bucket name"
  value       = aws_s3_bucket.main.id
}

output "bucket_arn" {
  description = "s3 bucket ARN"
  value       = aws_s3_bucket.main.arn
}

