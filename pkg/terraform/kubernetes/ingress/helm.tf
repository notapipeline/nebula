resource helm_release nginx {
  name = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  values = ["${path.root}/../kubernetes/ingress/nginx.yaml"]:qa

}
