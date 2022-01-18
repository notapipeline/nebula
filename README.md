# Kubernetes monitoring cluster

> ### Work in progress - not all automation is yet written or complete

This repository contains everything you need to set up a full kubernetes cluster for monitoring devices on your network
as well as running a full secret store (hashicorp vault) which can be unsealed from kwallet, libsecret, keepass or
bitwarden depending on your needs.

Once this repository is fully deployed you will have:

- Secrets
  - Hashicorp Vault with Consul backend
- Monitoring
  - InfluxDB
  - Loki
  - Grafana

In order to make all of this work, we will require some things to be installed bare-metal (VirtualBox, NGINX, Telegraf)
and the aforementioned applications will be installed inside the cluster.

The repo contains grafana dashboards for:

- System performance
- Network performance?
- Internet Speed
- NVIDIA Graphics
- UPS monitoring

Telegraf configuration is provided for all standard collections as well as NUT for those with UPS systems to monitor.

Applications provided:

- speedtestw - collect metrics from speedtest.net
- bwvault - unlock Vault from Bitwarden, Keepass, KWallet or LibSecrets
- dashdown - a simple client to download dashboards from grafana and extract the flux queries to seperate files

