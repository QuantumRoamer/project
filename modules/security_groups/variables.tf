variable "vpc_id" {
  description = "The VPC ID where security groups are created"
  type        = string
}

variable "local_user_ip" {
  description = "The IP of the user who can access the ALB"
  type        = list(string)
}
