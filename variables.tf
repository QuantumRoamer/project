variable "db_username" {
  description = "The username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "The password for the RDS database"
  type        = string
  sensitive   = true
}

variable "cidr_block" {
  description = "The cidr_block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name for VPC"
  type        = string
}

variable "alb_name" {
  description = "The name for ALB"
  type        = string
}

variable "db_instance_name" {
  description = "The name for the db instance"
  type        = string
}

variable "db_name" {
  description = "The name for db"
  type        = string
}

variable "ecs_service_name" {
  description = "The name for ECS service"
  type        = string
}

variable "ecs_container_name" {
  description = "The name for ECS container"
  type        = string
}

variable "ecs_task_family" {
  description = "The name for the ECS task"
  type        = string
}

variable "ecs_container_image" {
  description = "The name for ECS container image"
  type        = string
}

variable "local_user_ip" {
  description = "The IP of the user who can access the ALB"
  type        = list(string)
}
