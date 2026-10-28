# Módulo S3: crea un bucket PRIVADO

locals {
  # Los nombres de bucket deben ser únicos en todo AWS, por eso lleva el sufijo
  nombre = "${var.proyecto}-${var.nombre_bucket}-${var.sufijo}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.nombre

  tags = {
    Name = local.nombre
  }
}

# Esto es lo que lo hace PRIVADO: bloquea todo acceso público
resource "aws_s3_bucket_public_access_block" "privado" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
