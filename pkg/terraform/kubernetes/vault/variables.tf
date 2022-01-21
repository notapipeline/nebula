variable "namespace" {
  description = "Defines the namespace to store Vault and consul in"
  default     = "vault"
}

variable "domain" {
  description = "The domain hosting the vault and consul applications"
}
