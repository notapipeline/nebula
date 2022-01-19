variable "region" {
  description = "AWS region used for required resources"
}

variable "domain" {
  description = "The domain to host resources on"
}

variable "ifdevice" {
  description = "The outbound internet device handling networking for virtualbox images"
}

variable "organisation" {
  description = "The influxdb organisation to write metrics to"
}

variable "bucket" {
  description = "The influxdb organisations primary bucket to write metrics to"
}

variable "influx_token" {
  description = "The token used to authenticate to influxdb"
  sensitive   = true
}

variable "nut_password" {
  description = "The password used to authenticate to NUT UPS monitoring service"
  sensitive   = true
}

