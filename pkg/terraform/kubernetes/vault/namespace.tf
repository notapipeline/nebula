resource "kubernetes_namespace_v1" "vault" {
  metadata {
    name = var.namespace
  }
}
