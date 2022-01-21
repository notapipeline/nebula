resource "sys_systemd_unit" "unit" {
  name   = "telegraf.service"
  enable = true
  start  = true
  system = true
}
