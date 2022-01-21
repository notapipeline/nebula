variable "domain" {
  description = "The domain hosting the vault and consul applications"
}

variable "namespace" {
  description = "Defines the namespace to store monitoring applications in"
  default     = "monitoring"
}

variable "organisation" {
  description = "The influxdb organisation name to write metrics into"
}

variable "bucket" {
  description = "The primary bucket to write metrics data to"
}
