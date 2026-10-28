variable "aws_region" {
  description = "Region de AWS para el despliegue"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Nombre del ambiente de trabajo"
  type        = string
  default     = "demo"
}
```[cite: 3]