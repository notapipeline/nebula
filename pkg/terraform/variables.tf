variable "region" {
  description = "AWS region used for required resources"
}

variable "domain" {
  description = "The domain to host resources on"
}

variable "interface" {
  description = "The external interface to use. If not defined, will be automatically determined"
}

variable "organisation" {
  description = "The influxdb organisation to write metrics to"
}

variable "bucket" {
  description = "The influxdb organisations primary bucket to write metrics to"
}

variable "influx_token" {
  description = "The token used to authenticate to influxdb"
  sensitive   = true
}

variable "nut_password" {
  description = "The password used to authenticate to NUT UPS monitoring service"
  sensitive   = true
}

##
# database variables
variable "database_server" {
  description = "The database host to use for applications inside the stack"
}

variable "database_port" {
  description = "The port the database is listening on"
}

##
# Vagrant variables

variable "basename" {
  description = "The server name for each node (e.g. 'node'). Nodes will then be labelled as: 'node[1..n].my.domain'"
}

variable "nfs_server" {
  description = "The FQDN or IP address of the NFS server"
}

variable "nfs_path" {
  description = "Path where NFS shares are mounted"
}

variable "dhcp" {
  type        = bool
  description = "If true, will enable DHCP on the virtual machines"
}

variable "disksize" {
  type        = number
  description = "The size to build virtual machine hard disks"
}

variable "memory" {
  type        = number
  description = "How much RAM should each host have?"
}

variable "cpu" {
  type        = number
  description = "How many CPU cores to give each virtual machine"
}

variable "start_at" {
  type        = number
  description = "When assigning static IP addresses to the virtual machines, this is the first address"
}

variable "node_count" {
  type        = number
  description = "The number of nodes to create"
  default     = 3
}

variable "kubernetes_version" {
  description = "The Kubernetes version to install on the virtual machines"
  default     = "1.21.0-00"
}

locals {
  network = var.interface == "" ? join(
    ".", slice(split(".", data.external.network.result.network), 0, 3)
    ) : join(
    ".", slice(split(".", length(data.external.interface) == 1 ? data.external.interface[0].result.local : "127.0.0.1"), 0, 3)
  )
  interface = var.interface != "" ? var.interface : data.external.interface[0].result.label
}
