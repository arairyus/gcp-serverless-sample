resource "google_iam_workload_identity_pool" "gha" {
  workload_identity_pool_id = "gha-pool"
  display_name              = "gha"
}

resource "google_iam_workload_identity_pool_provider" "gha" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.gha.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
  }
  attribute_condition = "\"arairyus/gcp-serverless-sample\" == attribute.repository"
  oidc {
    allowed_audiences = ["https://github.com/arairyus"]
    issuer_uri        = "https://token.actions.githubusercontent.com"
  }
}
