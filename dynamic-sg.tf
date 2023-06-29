variable "sg-ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [8200, 8201, 8202, 8203, 8204, 8205]

}

resource "aws_security_group" "dynamic-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound/outbound traffic"

  dynamic "ingress" {
    for_each    = var.sg-ports
    iterator    = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each    = var.sg-ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  tags = {
    Name = "allow_tls"
  }
}
