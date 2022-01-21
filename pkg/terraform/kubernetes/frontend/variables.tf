variable "domain" {
  description = "The domain hosting the vault and consul applications"
}

variable "organisation" {
  description = "The unique name of the datacentre, organisation or domain hosting this application"
}

variable "namespace" {
  description = "Defines the namespace to store frontend applications in"
  default     = "frontend"
}

variable "database" {
  description = "database connection details"
  type = object({
    fqdn : string,
    port : number,
  })
}
