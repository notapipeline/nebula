data "external" "network" {
  program = [
    "bash",
    "-c",
    <<EOT
ip route get 8.8.8.8 | head -1 | awk '{print "{ \"network\": \"" $3 "\", \"device\": \"" $5 "\"}"}' | jq
EOT
  ]
}

data "external" "interface" {
  count = var.interface != "" ? 1 : 0
  program = [
    "bash",
    "-c",
    "ip --json a show dev ${var.interface} | jq '.[0].addr_info[] | select(.family==\"inet\") | walk(if type == \"number\" or type == \"boolean\" then tostring else . end)'"
  ]
}

/**
 * Abuse external dataprovider to set the root vbox property
 */
data "external" "vboxroot" {
  program = [
    "bash", "-c", "vboxmanage setproperty machinefolder ${var.machinefolder}; echo { \"status\": \"$?\" }"
  ]
}
