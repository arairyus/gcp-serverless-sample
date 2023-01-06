resource "google_service_account" "cicd" {
  account_id   = "cicd-sa"
  display_name = "CICD Service Account"
}

locals {
  cicd_sa_iams = [
    "roles/artifactregistry.writer"
  ]
}

resource "google_project_iam_member" "cicd" {
  project  = var.project_id
  for_each = toset(local.cicd_sa_iams)
  member   = google_service_account.cicd.member
  role     = each.key
}

data "google_project" "current" {}

resource "google_service_account_iam_binding" "cdcd" {
  service_account_id = google_service_account.cicd.name
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/projects/${data.google_project.current.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.gha.workload_identity_pool_id}/attribute.repository/arairyus/gcp-serverless-sample"
  ]
}
