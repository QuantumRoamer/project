variable "alb_name" {
  description = "Name for the ALB"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the ALB"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the ALB is deployed"
  type        = string
}
