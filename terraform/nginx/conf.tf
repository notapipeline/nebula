resource "local_file" "conf_d" {
  for_each             = fileset("${path.module}/../../config/", "nginx/conf.d/*.conf")
  content              = file("${path.module}/../../config/${each.key}")
  filename             = "/etc/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

