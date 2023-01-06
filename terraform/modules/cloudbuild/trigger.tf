#resource "google_cloudbuild_trigger" "terraform-trigger" {
#  location = var.location
#
#  trigger_template {
#    branch_name = var.branch_name
#    repo_name   = var.repo_name
#  }
#
#  substitutions = {
#    _FOO = "bar"
#    _BAZ = "qux"
#  }
#
#  filename = "cloudbuild.yaml"
#}

resource "google_cloudbuild_trigger" "app-trigger" {
  location = var.location

  github {
    name  = var.repo_name
    owner = var.owner_name

    push {
      branch       = var.branch_name
      invert_regex = false
    }
  }

  ignored_files = [
    "terraform/*"
  ]



  filename = "cloudbuild.app.yaml"

  service_account = google_service_account.cloudbuild.id
}
