output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}

output "private_ec2_id" {
  value = module.ec2.private_instance_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
