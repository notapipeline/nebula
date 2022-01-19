variable "domain" {
  description = "The domain used for VM naming"
}

variable "organisation" {
  description = "The influxdb organisation to write metrics to"
}

variable "bucket" {
  description = "The influxdb organisations primary bucket to write metrics to"
}

variable "token" {
  description = "The token used to authenticate to influxdb"
  sensitive   = true
}

