resource "sys_file" "system" {
  for_each             = fileset("${path.module}/../../config/", "systemd/system/*.service")
  content              = templatefile("${path.module}/../../config/${each.key}", { domain = var.domain })
  filename             = "/usr/lib/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

resource "sys_systemd_unit" "units" {
  for_each = toset(flatten([
    for key, _ in sys_file.system : length(split("@", basename(key))) == 2 ? [
      for value in local.services[trimsuffix(basename(key), ".service")] : "${trimsuffix(basename(key), ".service")}${value}"
  ] : [basename(key)]]))
  name   = each.key
  enable = true
  start  = true
  system = true
}
