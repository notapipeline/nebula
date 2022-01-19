resource "local_file" "conf_d" {
  for_each = fileset("${path.module}/../../config/", "nginx/conf.d/*.conf")
  content = templatefile("${path.module}/../../config/${each.key}", {
    lbaddrs          = toset(local.lbaddrs),
    insecureport     = 32080,
    secureport       = 32443,
    vaultserviceport = 31668,
  })
  filename             = "/etc/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

