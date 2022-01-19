resource "local_file" "snippets" {
  for_each             = fileset("${path.module}/../../config/", "nginx/snippets/*.conf")
  content              = file("${path.module}/../../config/${each.key}")
  filename             = "/etc/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

