module "systemd" {
  source = "./systemd"
  domain = var.domain
}

/*module "nginx" {
  source = "./nginx"
}*/
