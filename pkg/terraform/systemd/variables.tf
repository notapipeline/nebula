variable "domain" {
  description = "The domain used for VM naming"
}

variable "services" {
  type        = map(list(string))
  description = "A map of subnodes to create when a systemd file is a template"
  default     = {}
}

locals {
  services = merge(var.services, {
    "clusternode@" : keys(data.external.nodes.result)
  })
}
