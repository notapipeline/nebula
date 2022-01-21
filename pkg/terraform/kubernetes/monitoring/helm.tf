resource "helm_release" "influxdb" {
  name       = "influxdb2"
  repository = "https://helm.influxdata.com"
  chart      = "influxdb2"
  namespace  = var.namespace
  values = [
    templatefile("${path.root}/../kubernetes/namespaces/monitoring/influxdb2.yaml", {
      domain       = var.domain,
      organisation = var.organisation,
      bucket       = var.bucket,
    }),
  ]

  depends_on = [
    kubernetes_namespace_v1.monitoring,
  ]
}

resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki"
  namespace  = var.namespace
  values = [
    templatefile("${path.root}/../kubernetes/namespaces/monitoring/loki.yaml", {
      domain = var.domain,
    }),
  ]

  depends_on = [
    kubernetes_namespace_v1.monitoring,
  ]
}

