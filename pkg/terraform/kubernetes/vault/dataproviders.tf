data "external" "consul_encryption" {
  program = [
    "bash",
    "-c",
    "${path.root}/scripts/consul.bash ${var.namespace}",
  ]

  depends_on = [
    kubernetes_secrets_v1.consul_encryption,
  ]
}

data "external" "consul_cert" {
  program = [
    "bash",
    "-c",
    "${path.root}/scripts/letsencrypt.bash ${var.namespace} ${kubernetes_secret_v1.consul_cert.name} consul.${var.domain} ${var.letsencrypt ? 0 : 1}",
  ]

  depends_on = [
    kubernetes_secrets_v1.consul_cert,
  ]
}

data "external" "vault_cert" {
  program = [
    "bash",
    "-c",
    "${path.root}/scripts/letsencrypt.bash ${var.namespace} ${kubernetes_secret_v1.vault_cert.name} vault.${var.domain} ${var.letsencrypt ? 0 : 1}",
  ]

  depends_on = [
    kubernetes_secrets_v1.vault_cert,
  ]
}

