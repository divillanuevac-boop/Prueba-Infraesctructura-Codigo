# Lo que Terraform muestra al terminar

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "ec2_ids" {
  value = module.ec2[*].instance_id
}

output "nlb_dns" {
  value = module.nlb[*].nlb_dns
}

output "buckets" {
  value = [for b in module.s3 : b.bucket_nombre]
}

output "sufijo_aleatorio" {
  value = local.sufijo
}
