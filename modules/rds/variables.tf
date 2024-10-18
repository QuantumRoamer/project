variable "db_instance_name" {
  description = "The name of the RDS DB instance"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "vpc_security_group_id" {
  description = "The security group ID for the RDS instance"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}
