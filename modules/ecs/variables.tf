variable "task_family" {
  description = "The name of the task family"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_image" {
  description = "The Docker image for the container"
  type        = string
}

variable "cpu" {
  description = "The amount of CPU to allocate"
  type        = number
  default     = "256"
}

variable "memory" {
  description = "The amount of memory to allocate"
  type        = number
  default     = "256"
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the ECS service"
  type        = list(string)
}

variable "target_group_arn" {
  description = "Target group ARN for the ALB"
  type        = string
}

variable "desired_count" {
  description = "Number of desired tasks"
  type        = number
}

variable "db_endpoint" {
  description = "The endpoint of the RDS database"
  type        = string
}

variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "task_cpu" {
  description = "The number of CPU units used by the task"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = string
  default     = "512"
}

variable "log_group_name" {
  description = "The name of the CloudWatch log group"
  type        = string
}

variable "alb_dns_name" {
  description = "The name of the ALB"
  type        = string
}
