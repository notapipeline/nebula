module "kubernetes" {
  source       = "./kubernetes"
  domain       = var.domain
  organisation = var.organisation
  bucket       = var.bucket
  letsencrypt  = var.letsencrypt
}

module "systemd" {
  source = "./systemd"
  domain = var.domain

  depends_on = [
    module.kubernetes,
  ]
}

module "nginx" {
  source   = "./nginx"
  domain   = var.domain
  ifdevice = var.interface

  depends_on = [
    module.kubernetes,
  ]
}

module "telegraf" {
  source       = "./telegraf"
  domain       = var.domain
  organisation = var.organisation
  bucket       = var.bucket
  token        = var.influx_token

  depends_on = [
    module.kubernetes,
  ]
}

module "nut" {
  source   = "./nut"
  domain   = var.domain
  password = var.nut_password

  depends_on = [
    module.telegraf,
  ]
}

