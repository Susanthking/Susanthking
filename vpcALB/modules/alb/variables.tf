variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "subnets" {
  description = "The subnets to attach the ALB to"
  type        = list(string)
}

variable "security_group_ids" {
  description = "The security group IDs to attach to the ALB"
  type        = list(string)
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

variable "listener_port" {
  description = "The port for the listener"
  type        = number
  default     = 80
}

