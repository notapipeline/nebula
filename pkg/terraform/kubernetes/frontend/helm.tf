resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = var.namespace
  values = [
    templatefile("${path.root}/../kubernetes/namespaces/frontend/grafana.yaml", {
      domain           = var.domain,
      organisation     = var.organisation,
      database_address = var.database.fqdn,
      database_port    = var.database.port,
    }),
  ]

  depends_on = [
    kubernetes_namespace_v1.frontend,
  ]
}

