variable "google_project" {
  description = "Google Project to create resources in."
  type        = string
  default     = null
}

variable "environment" {
  description = "Operating environment"
  type        = string
  default     = "dev"
}
