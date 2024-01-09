resource "nomad_job" "postgres" {
  jobspec = templatefile("${path.module}/files/postgres.nomad.hcl", {
    hash : var.postgres_hash,
    version : var.postgres_version,
    postgres_version : var.postgres_version,
    postgres_user : var.postgres_user,
    postgres_password : var.postgres_password,
    postgres_db : var.postgres_db,
  })
}
