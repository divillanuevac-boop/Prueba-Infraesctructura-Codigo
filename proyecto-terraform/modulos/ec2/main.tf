# Módulo EC2: crea un servidor (máquina virtual)

locals {
  nombre = "ec2-${var.proyecto}-${var.numero}-${var.sufijo}"
}

# Buscamos automáticamente la imagen (AMI) más nueva de Amazon Linux
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_instance" "servidor" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.tipo_instancia
  subnet_id     = var.subnet_id

  tags = {
    Name = local.nombre
  }
}
