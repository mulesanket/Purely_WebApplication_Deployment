
output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "bastion_eip" {
  value = aws_eip.bastion_eip.public_ip
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}
