resource "vagrant_vm" "cluster" {
  name            = "cluster"
  vagrantfile_dir = "${path.root}/../infrastructure"
  depends_on = [
    data.external.vboxroot,
    local_file.vagrantfile,
  ]
}
