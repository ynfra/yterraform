resource "nomad_job" "mariadb" {
  jobspec = templatefile("${path.module}/files/mariadb.nomad.hcl", {
    hash : var.mariadb_hash,
    version : var.mariadb_version,
    mariadb_version : var.mariadb_version,
    mariadb_user : var.mariadb_user,
    mariadb_password : var.mariadb_password,
    mariadb_db : var.mariadb_db,
  })
}
