variable "domain" {
  description = "The domain used for VM naming"
}

locals {
  lbaddrs = values(data.external.addresses.result)
}

