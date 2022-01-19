data "external" "addresses" {
  program = [
    "bash",
    "-c",
    <<EOT
(
  echo '{';
  for node in $(vboxmanage list vms | grep '${var.domain}' | awk -F. '{ gsub("\"", ""); print $1; }'); do
    echo -n "$node ";
    vboxmanage guestproperty enumerate $node.${var.domain} | grep '.*IP.*'$(
      ip --json a show dev enp5s0 | jq -r '.[0].addr_info[] | select(.family=="inet").local' | cut -d. -f1-3
    ) | awk '{
      gsub(",", "");
      print "\""$4"\""
    }';
  done | awk 'BEGIN { l=0 } {
    array[l++]=(sprintf("\"%s\": %s", $1, $2));
  } END {
    for (i=0; i<l; i++) {
      printf("%s", array[i]);
      if (i<l-1) print ","
    }
  }';
  echo '}'
) | jq
EOT
  ]
}
