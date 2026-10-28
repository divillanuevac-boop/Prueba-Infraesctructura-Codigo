# Módulo NLB: Network Load Balancer (balanceador de carga de red)

locals {
  nombre = "nlb-${var.proyecto}-${var.numero}-${var.sufijo}"
}

# El balanceador en sí
resource "aws_lb" "balanceador" {
  name               = local.nombre
  load_balancer_type = "network"
  internal           = true # interno: no necesita Internet Gateway
  subnets            = var.subnet_ids

  tags = {
    Name = local.nombre
  }
}

# Grupo de destino: a quién le manda el tráfico
resource "aws_lb_target_group" "grupo" {
  name        = "tg-${var.proyecto}-${var.numero}-${var.sufijo}"
  port        = var.puerto
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"
}

# Conectamos el servidor EC2 al grupo
resource "aws_lb_target_group_attachment" "conexion" {
  target_group_arn = aws_lb_target_group.grupo.arn
  target_id        = var.instance_id
  port             = var.puerto
}

# Listener: escucha en un puerto y reenvía al grupo
resource "aws_lb_listener" "escucha" {
  load_balancer_arn = aws_lb.balanceador.arn
  port              = var.puerto
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grupo.arn
  }
}
