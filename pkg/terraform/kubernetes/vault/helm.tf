
resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  namespace  = var.namespace
  values = [
    templatefile("${path.root}/../kubernetes/namespaces/vault/consul.yaml", {
      domain = var.domain,
    }),
  ]

  depends_on = [
    kubernetes_namespace_v1.vault,
    kubernetes_secret_v1.consul_cert,
    kubernetes_secret_v1.consul_encryption,
  ]
}

resource "helm_release" "vault" {
  name       = "vault"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  namespace  = var.namespace
  values = [
    templatefile("${path.root}/../kubernetes/namespaces/vault/vault.yaml", {
      domain = var.domain,
    }),
  ]

  depends_on = [
    kubernetes_namespace_v1.vault,
    kubernetes_secret_v1.vault_cert,
    helm_release.consul,
  ]
}
