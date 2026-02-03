output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "private_subnets" {
  value = module.vpc.private_subnet_ids
}

output "kms_key_arn" {
  value = module.kms.key_arn
}
