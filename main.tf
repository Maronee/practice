resource "google_sql_database_instance" "main" {
  name             = "main-instance"
  project          = "my-dev-project"
  database_version = "POSTGRES_15"
  region           = "europe-west3"

  settings {
    tier = "db-f1-micro"
  }
}

locals {
  #users
  database_admin_group = "dba@mycompany.com"
  database_dev_group   = "db-ops@mycompany.com"
}

resource "google_project_iam_member" "db_admin" {
  project = "my-dev-project"
  role    = "roles/cloudsql.admin"
  member  = "group:${local.database_admin_group}"
}

resource "google_project_iam_member" "developer_db_access_dev" {
  project = "my-dev-project"
  role    = "roles/cloudsql.editor"
  member  = "group:${local.database_dev_group}"
}

resource "google_project_iam_member" "ops_db_access_non_dev" {
  project = "my-uat-project"
  role    = "roles/cloudsql.viewer"
  member  = "group:${local.database_dev_group}"
}
