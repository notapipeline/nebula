resource "kubernetes_secret_v1" "vault_cert" {
  metadata {
    name      = "choclab-vault-cert"
    namespace = var.namespace
  }

  data = {
    "tls.crt" = "",
    "tls.key" = "",
  }

  lifecycle {
    ignore_changes = [
      data,
    ]
  }

  depends_on = [
    kubernetes_namespace_v1.vault
  ]
}

resource "kubernetes_secret_v1" "consul_cert" {
  metadata {
    name      = "choclab-consul-cert"
    namespace = var.namespace
  }

  data = {
    "tls.crt" = "",
    "tls.key" = "",
  }

  lifecycle {
    ignore_changes = [
      data,
    ]
  }

  depends_on = [
    kubernetes_namespace_v1.vault
  ]
}

resource "kubernetes_secret_v1" "consul_encryption" {
  metadata {
    name      = "consul"
    namespace = var.namespace
  }

  data = {
    "cacrt"  = "",
    "cakey"  = "",
    "gossip" = "",
  }

  lifecycle {
    ignore_changes = [
      data,
    ]
  }

  depends_on = [
    kubernetes_namespace_v1.vault
  ]
}
