resource "local_file" "ups" {
  for_each             = fileset("${path.module}/../../config/ups", "*.conf")
  content              = templatefile("${path.module}/../../config/ups/${each.key}", { password = var.password })
  filename             = "/etc/nut/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

resource "local_file" "upsdusers" {
  content              = templatefile("${path.module}/../../config/ups/upsd.users", { password = var.password })
  filename             = "/etc/nut/upsd.users"
  directory_permission = "0755"
  file_permission      = "0644"
}

