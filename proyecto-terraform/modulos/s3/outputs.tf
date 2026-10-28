output "bucket_nombre" {
  description = "Nombre final del bucket"
  value       = aws_s3_bucket.bucket.bucket
}

output "bucket_arn" {
  description = "ARN del bucket"
  value       = aws_s3_bucket.bucket.arn
}
