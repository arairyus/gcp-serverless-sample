resource "google_service_account" "cloudbuild" {
  account_id   = "cloudbuild-sa"
  display_name = "CloudBuild svc account"
}

locals {
  cloudbuild_sa_iams = [
    "roles/artifactregistry.writer",
    "roles/logging.logWriter"
  ]
}

resource "google_project_iam_member" "cloudbuild" {
  project  = var.project_id
  for_each = toset(local.cloudbuild_sa_iams)
  member   = google_service_account.cloudbuild.member
  role     = each.key
}
