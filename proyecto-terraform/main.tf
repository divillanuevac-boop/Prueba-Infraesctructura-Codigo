# Módulo raíz: aquí se usan (se "llaman") los módulos hijos

# 1) Texto aleatorio de 6 caracteres (provider random)
resource "random_string" "sufijo" {
  length  = 6
  special = false # sin símbolos
  upper   = false # sin mayúsculas (S3 no las acepta)
}

# 2) locals: guardamos el texto aleatorio para usarlo después
locals {
  sufijo = random_string.sufijo.result
}

# 3) VPC con sus 2 subredes
module "vpc" {
  source = "./modulos/vpc"

  proyecto      = var.proyecto
  sufijo        = local.sufijo
  vpc_cidr      = var.vpc_cidr
  subredes_cidr = var.subredes_cidr
}

# 4) 2 EC2 (count repite el módulo 2 veces)
module "ec2" {
  source = "./modulos/ec2"
  count  = var.cantidad_servidores

  proyecto       = var.proyecto
  sufijo         = local.sufijo
  numero         = count.index + 1
  tipo_instancia = var.tipo_instancia
  subnet_id      = module.vpc.subnet_ids[count.index] # subred 1 y subred 2
}

# 5) 2 Network Load Balancer
module "nlb" {
  source = "./modulos/nlb"
  count  = var.cantidad_servidores

  proyecto    = var.proyecto
  sufijo      = local.sufijo
  numero      = count.index + 1
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = [module.vpc.subnet_ids[count.index]]
  instance_id = module.ec2[count.index].instance_id
}

# 6) 2 buckets S3 privados (for_each repite una vez por cada nombre)
module "s3" {
  source   = "./modulos/s3"
  for_each = toset(var.nombres_buckets)

  proyecto      = var.proyecto
  sufijo        = local.sufijo
  nombre_bucket = each.key
}
