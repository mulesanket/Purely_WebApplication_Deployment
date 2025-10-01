//EFS Security Group Configuration
resource "aws_security_group" "efs_sg" {
  name        = "${var.name_prefix}-efs-sg"
  description = "Security group for EFS allowing NFS access"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow NFS from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-efs-sg"
  }
}