resource "kubernetes_secret_v1" "influx_auth" {
  metadata {
    name      = "influxdb2-auth"
    namespace = var.namespace
  }

  data = {
    "admin-token"    = "",
    "admin-password" = "",
  }

  lifecycle {
    ignore_changes = [
      data,
    ]
  }

  depends_on = [
    kubernetes_namespace_v1.monitoring,
  ]
}

