resource "helm_release" "nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  values     = [file("${path.root}/../kubernetes/namespaces/ingress/nginx.yaml")]
}
