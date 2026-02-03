resource "aws_kms_key" "eks" {
  description             = "EKS secrets encryption key"
  enable_key_rotation     = true
}

resource "aws_kms_alias" "eks" {
  name          = "alias/eks-${var.name}"
  target_key_id = aws_kms_key.eks.key_id
}
