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
```
variable "users" {
  type    = list(string)
  default = ["./user10", "./user11", "./user12"]
}

resource "local_sensitive_file" "user_passwords" {
  for_each = toset(var.users)
  filename = each.key
  content  = "password: S3cr3tP@ssw0rd"
}
```[cite: 2]
# Llamando al módulo local que creaste en la carpeta /server
module "server" {
  source          = "./server"
  ami             = "ami-0c55b159cbfafe1f0" # O la AMI que uses
  subnet_id       = "subnet-0123456789abcdef0"
  security_groups = []
}

# Llamando a un módulo del Registry Público (ej. S3 Bucket con versión fija)
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "2.11.1"
}
```[cite: 1]