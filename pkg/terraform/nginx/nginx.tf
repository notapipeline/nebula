resource "local_file" "nginx" {
  content              = file("${path.module}/../../config/nginx/nginx.conf")
  filename             = "/etc/nginx/nginx.conf"
  directory_permission = "0755"
  file_permission      = "0644"
}

