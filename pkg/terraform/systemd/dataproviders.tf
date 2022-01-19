data "external" "nodes" {
  program = [
    "bash",
    "-c",
    <<EOT
awk 'BEGIN {l=0} { gsub(".${var.domain}", ""); array[l++]=$1} END {print "{"; for (i=0; i<l; i++) { printf("%s:%s",
array[i], array[i]); if (i < l-1) print ",";}; print "}" }' <<< $(vboxmanage list vms | grep '${var.domain}') | jq
EOT
  ]
}

