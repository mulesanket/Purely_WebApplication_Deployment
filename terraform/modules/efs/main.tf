//EFS File System Resource
resource "aws_efs_file_system" "myefs" {
  creation_token   = "${var.name_prefix}-efs"
  performance_mode = "generalPurpose"

  tags = {
    Name = "${var.name_prefix}-efs"
  }
}

// EFS Mount Target Resource
resource "aws_efs_mount_target" "this" {
  count           = length(var.private_subnet_ids)
  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = var.private_subnet_ids[count.index]
  security_groups = [var.efs_security_group_id]
}
