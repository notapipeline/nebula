resource "local_file" "stream_d" {
  for_each             = fileset("${path.module}/../../config/", "nginx/stream.d/*.conf")
  content              = file("${path.module}/../../config/${each.key}")
  filename             = "/etc/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

