variable "name" {}
variable "subnet_ids" { type = list(string) }
variable "cluster_role_arn" {}
variable "node_role_arn" {}
variable "kms_key_arn" {}
