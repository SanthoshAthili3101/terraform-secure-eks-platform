
# -------------------
# VPC
# -------------------
module "vpc" {
  source = "../../modules/vpc"

  name            = "dev"
  cidr            = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Environment = "dev"
    Project     = "terraform-secure-eks"
  }
}

# -------------------
# IAM
# -------------------
module "iam" {
  source = "../../modules/iam"
  name   = "dev"
}

# -------------------
# KMS
# -------------------
module "kms" {
  source = "../../modules/kms"
  name   = "dev"
}

# -------------------
# Logging
# -------------------
module "logging" {
  source = "../../modules/logging"
  name   = "dev"
}

# -------------------
# Security (SG)
# -------------------
module "security" {
  source   = "../../modules/security"
  name     = "dev"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = "10.0.0.0/16"
}

# -------------------
# EKS
# -------------------
module "eks" {
  source = "../../modules/eks"

  name             = "dev-eks"
  subnet_ids       = module.vpc.private_subnet_ids
  cluster_role_arn = module.iam.cluster_role_arn
  node_role_arn    = module.iam.node_role_arn
  kms_key_arn      = module.kms.key_arn
}

# -------------------
# Monitoring
# -------------------
module "monitoring" {
  source = "../../modules/monitoring"
  name   = "dev"
}
