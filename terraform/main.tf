module "systemd" {
  source = "./systemd"
  domain = var.domain
}

module "nginx" {
  source = "./nginx"
  domain = var.domain
}

module "telegraf" {
  source       = "./telegraf"
  domain       = var.domain
  organisation = var.organisation
  bucket       = var.bucket
  token        = var.influx_token
}

module "nut" {
  source   = "./nut"
  domain   = var.domain
  password = var.nut_password
}
