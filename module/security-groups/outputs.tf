output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "private_ec2_sg_id" {
  value = aws_security_group.private_ec2_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
