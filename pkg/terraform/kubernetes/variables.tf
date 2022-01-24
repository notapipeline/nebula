variable "domain" {
  description = "The domain used for VM naming"
}

variable "organisation" {
  description = "The unique name of the organisation hosting applications"
}

variable "bucket" {
  description = "The unique name of the data bucket"
}

variable "letsencrypt" {
  type        = bool
  description = "Use letsencrypt service for certificates"
}
