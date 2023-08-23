variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where EKS node group will be deployed"
  type        = list(string)
}

variable "instance_types" {
  description = "List of instance types for the EKS node group"
  type        = list(string)
}

variable "scaling_config" {
  description = "Scaling configuration for the EKS node group"
  type        = map(number)
}

variable "update_config" {
  description = "Update configuration for the EKS node group"
  type        = map(number)
}
