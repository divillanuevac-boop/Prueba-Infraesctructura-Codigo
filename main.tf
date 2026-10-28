terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Data Source para Ubuntu
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  owners = ["099720109477"]
}

# Bloque Locals
locals {
  prefijo_nombre = "infra-evaluacion"
}

# Uso de Módulo Local
module "server" {
  source          = "./server"
  ami             = data.aws_ami.ubuntu.id
  subnet_id       = "subnet-0123456789abcdef0" # Ajustar si te piden una subred específica
  security_groups = []
}

# Uso de Módulo del Registry Público (S3)
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.11.1"
}
```[cite: 1, 3]