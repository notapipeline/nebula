resource "kubernetes_namespace_v1" "ingress" {
  metadata {
    name = "ingress-nginx"
  }
}
