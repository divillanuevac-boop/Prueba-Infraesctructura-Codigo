# Módulo VPC: crea la red y sus subredes

# locals = variables internas que se calculan aquí adentro
locals {
  nombre = "vpc-${var.proyecto}-${var.sufijo}"
}

# Pedimos a AWS las zonas de disponibilidad (a, b, c...)
data "aws_availability_zones" "disponibles" {
  state = "available"
}

# La VPC
resource "aws_vpc" "principal" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = local.nombre
  }
}

# Las subredes: "count" repite el recurso una vez por cada CIDR de la lista
resource "aws_subnet" "subredes" {
  count             = length(var.subredes_cidr)
  vpc_id            = aws_vpc.principal.id
  cidr_block        = var.subredes_cidr[count.index]
  availability_zone = data.aws_availability_zones.disponibles.names[count.index]

  tags = {
    Name = "${local.nombre}-subred-${count.index + 1}"
  }
}
