module "vault" {
  source     = "./vault"
  domain     = var.domain
  datacentre = var.organisation
}

module "monitoring" {
  source       = "./monitoring"
  organisation = var.organisation
  bucket       = var.bucket
  domain       = var.domain
}

module "frontend" {
  source       = "./frontend"
  domain       = var.domain
  organisation = var.organisation
  database = {
    fqdn = "nebula.${var.domain}",
    port = 3306,
  }
}

module "ingress" {
  source = "./ingress"
}
