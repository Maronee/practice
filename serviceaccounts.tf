# Workload Service Accounts
resource "google_service_account" "accounts_ms_workload" {
  account_id = "accounts-ms"
  project    = "my-dev-project"
}

resource "google_service_account" "payments_ms_workload" {
  account_id = "payments-ms"
  project    = "my-dev-project"
}

resource "google_service_account" "transactions_ms_workload" {
  account_id = "transactions-ms"
  project    = "my-dev-project"
}

resource "google_service_account" "investments_ms_workload" {
  account_id = "service-account-id"
  project    = "my-dev-project"
}

# Default Permissions for Monitoring
resource "google_project_iam_member" "accounts_sa_can_write_metrics" {
  project = "my-dev-project"
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.accounts_ms_workload.email}"
}

resource "google_project_iam_member" "accounts_sa_can_write_logs" {
  project = "my-dev-project"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.accounts_ms_workload.email}"
}

resource "google_project_iam_member" "payments_sa_can_write_metrics" {
  project = "my-dev-project"
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.payments_ms_workload.email}"
}

resource "google_project_iam_member" "payments_sa_can_write_logs" {
  project = "my-dev-project"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.payments_ms_workload.email}"
}

resource "google_project_iam_member" "transactions_sa_can_write_metrics" {
  project = "my-dev-project"
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.transactions_ms_workload.email}"
}

resource "google_project_iam_member" "transactions_sa_can_write_logs" {
  project = "my-dev-project"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.transactions_ms_workload.email}"
}

resource "google_project_iam_member" "investments_sa_can_write_metrics" {
  project = "my-dev-project"
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.investments_ms_workload.email}"
}

resource "google_project_iam_member" "investments_sa_can_write_logs" {
  project = "my-dev-project"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.investments_ms_workload.email}"
}

# Workload Indentity
resource "google_service_account_iam_member" "accounts_workload_binding" {
  service_account_id = google_service_account.accounts_ms_workload.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:my-dev-project.svc.id.goog[default/accounts-ms]"
}

resource "google_service_account_iam_member" "payments_workload_binding" {
  service_account_id = google_service_account.payments_ms_workload.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:my-dev-project.svc.id.goog[default/payments-ms]"
}

resource "google_service_account_iam_member" "transactions_workload_binding" {
  service_account_id = google_service_account.transactions_ms_workload.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:my-dev-project.svc.id.goog[default/transactions-ms]"
}

resource "google_service_account_iam_member" "investments_workload_binding" {
  service_account_id = google_service_account.investments_ms_workload.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:my-dev-project.svc.id.goog[default/investments-ms]"
}
