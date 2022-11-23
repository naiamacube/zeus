variable "gcp_credentials" {
  description = "GCP SA Private Key"
  type        = string
  sensitive   = true
}

variable "gcp_region" {
  description = "GCP Region"
  type        = string
  sensitive   = true
}

variable "gcp_zone" {
  description = "GCP Zone"
  type        = string
  sensitive   = true
}
