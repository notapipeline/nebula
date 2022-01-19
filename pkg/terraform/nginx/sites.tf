resource "nginx_server_block" "sites" {
  for_each = fileset("${path.module}/../../config/nginx/sites", "*.conf")
  filename = each.key
  enable   = true
  content  = templatefile("${path.module}/../../config/nginx/sites/${each.key}", { domain = var.domain })
}
