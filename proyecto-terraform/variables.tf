# Variables del módulo raíz (los valores se ponen en terraform.tfvars)

variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "proyecto" {
  description = "Nombre del proyecto"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "subredes_cidr" {
  description = "CIDR de las subredes"
  type        = list(string)
}

variable "cantidad_servidores" {
  description = "Cuántos EC2 y NLB crear"
  type        = number
  default     = 2
}

variable "tipo_instancia" {
  description = "Tamaño de los EC2"
  type        = string
  default     = "t2.micro"
}

variable "nombres_buckets" {
  description = "Nombres cortos de los buckets S3"
  type        = list(string)
  default     = ["datos", "logs"]
}
