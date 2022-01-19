variable "domain" {
  description = "The domain used for VM naming"
}

variable "ifdevice" {
  description = "The outbound internet device handling networking for virtualbox images"
}

locals {
  lbaddrs = values(data.external.addresses.result)
}

