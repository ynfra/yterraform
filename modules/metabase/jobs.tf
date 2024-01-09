resource "nomad_job" "metabase" {
  jobspec = templatefile("${path.module}/files/metabase.nomad.hcl", {
    version : var.metabase_version,
    hash : var.metabase_hash,
    url : var.metabase_url,
    metabase_timezone : var.metabase_timezone,
    metabase_password_complexity : var.metabase_password_complexity,
    metabase_password_length : var.metabase_password_length,
    metabase_db_type : var.metabase_db_type,
    metabase_db_dbname : var.metabase_db_dbname,
    metabase_db_port : var.metabase_db_port,
    metabase_db_user : var.metabase_db_user,
    metabase_db_pass : var.metabase_db_pass,
    metabase_db_host : var.metabase_db_host
  })
}
