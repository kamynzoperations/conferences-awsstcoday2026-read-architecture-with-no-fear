variable "aws_region" {
  description = "AWS region for all storage resources"
  type        = string
  default     = "us-east-1"
}

variable "account_alias" {
  description = "AWS account alias used as bucket name prefix"
  type        = string
  default     = "cmoperations2026s1"
}

variable "state_bucket_name" {
  description = "Name of the Terraform state S3 bucket"
  type        = string
  default     = "cmoperations2026s1-terraform-state"
}

variable "artifacts_bucket_name" {
  description = "Name of the demo artifacts S3 bucket"
  type        = string
  default     = "cmoperations2026s1-artifacts"
}

variable "state_retention_days" {
  description = "Number of days to retain noncurrent state file versions"
  type        = number
  default     = 90
}
