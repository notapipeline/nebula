variable "domain" {
  description = "The domain hosting the vault and consul applications"
}

variable "datacentre" {
  description = "The unique name of the datacentre, organisation or domain hosting this application"
}

variable "namespace" {
  description = "Defines the namespace to store Vault and consul in"
  default     = "vault"
}

