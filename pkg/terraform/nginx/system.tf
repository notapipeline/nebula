resource "sys_systemd_unit" "unit" {
  name   = "nginx.service"
  enable = true
  start  = true
  system = true
}
