resource "kubernetes_secret_v1" "grafana_db" {
  metadata {
    name      = "grafana-db"
    namespace = var.namespace
  }

  data = {
    "GF_DATABASE_PASSWORD" = "",
    "GF_DATABASE_USER"     = "",
  }

  lifecycle {
    ignore_changes = [
      data,
    ]
  }

  depends_on = [
    kubernetes_namespace_v1.frontend,
  ]
}

resource "kubernetes_secret_v1" "grafana_admin" {
  metadata {
    name      = "grafana-admin"
    namespace = var.namespace
  }

  data = {
    "username" = "",
    "password" = "",
  }

  lifecycle {
    ignore_changes = [
      data,
    ]
  }

  depends_on = [
    kubernetes_namespace_v1.frontend,
  ]
}

