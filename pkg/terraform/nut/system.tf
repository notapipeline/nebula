resource "sys_systemd_unit" "units" {
  for_each = toset(["nut-client", "nut-server", "nut-monitor"])
  name     = "${each.key}.service"
  enable   = true
  start    = true
  system   = true
}
