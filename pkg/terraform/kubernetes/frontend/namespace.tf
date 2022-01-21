resource "kubernetes_namespace_v1" "frontend" {
  metadata {
    name = var.namespace
  }
}

