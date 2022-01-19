module "systemd" {
  source = "./systemd"
  domain = var.domain
}

module "nginx" {
  source = "./nginx"
}

module "telegraf" {
  source = "./telegraf"
}
