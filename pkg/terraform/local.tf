resource "local_file" "vagrantfile" {
  content = templatefile("${path.module}/../config/vagrantfile.tpl", {
    basename           = var.basename,
    domain             = var.domain,
    nfs_server         = var.nfs_server,
    nfs_path           = var.nfs_path,
    interface          = local.interface,
    dhcp               = var.dhcp,
    network            = local.network,
    disksize           = var.disksize,
    memory             = var.memory,
    cpu                = var.cpu,
    kubernetes_version = var.kubernetes_version,
    count              = var.node_count,
    start_at           = var.start_at
  })
  filename             = "${path.module}/../infrastructure/Vagrantfile"
  directory_permission = "0755"
  file_permission      = "0644"
}
