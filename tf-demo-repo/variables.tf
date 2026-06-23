variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-west-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "webapp"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.medium"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "container_image" {
  description = "Docker image for the ECS service"
  type        = string
  default     = "nginx:latest"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 2
}
