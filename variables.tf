variable "region" {
  type        = string
  default     = "us-east-1"
  description = "The main region used by the company"
}

variable "state_bucket_name" {
  type        = string
  default     = "tobias-iac-state-bucket"
  description = "The terraform state bucket"
}