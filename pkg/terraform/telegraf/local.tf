resource "local_file" "telegraf_d" {
  for_each             = fileset("${path.module}/../../config/", "telegraf/telegraf.d/*.conf")
  content              = file("${path.module}/../../config/${each.key}")
  filename             = "/etc/${each.key}"
  directory_permission = "0755"
  file_permission      = "0644"
}

resource "local_file" "telegraf" {
  content = templatefile("${path.module}/../../config/telegraf/telegraf.conf", {
    influx_url   = "https://influx.${var.domain}",
    organisation = var.organisation,
    bucket       = var.bucket,
    token        = var.token,
  })
  filename             = "/etc/telegraf/telegraf.conf"
  directory_permission = "0755"
  file_permission      = "0644"
}

resource "local_file" "upsscript" {
  content              = file("${path.module}/../../config/telegraf/ups.py")
  filename             = "/etc/telegraf/ups.py"
  directory_permission = "0755"
  file_permission      = "0755"
}
