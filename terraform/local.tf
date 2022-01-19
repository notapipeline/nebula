resource "local_file" "cluster" {
  content              = file("${path.module}/../config/systemd/system/clusternode@.service")
  filename             = "/usr/lib/systemd/system/clusternode@.service"
  directory_permission = "0755"
  file_permission      = "0644"
}

