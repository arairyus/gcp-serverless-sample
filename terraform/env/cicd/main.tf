terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.47.0"
    }
  }
}

provider "google" {
  region  = var.default_region
  project = var.project_id
}

module "cloudbuild" {
  source      = "../../modules/cloudbuild"
  project_id  = var.project_id
  location    = var.location
  branch_name = var.branch_name
  repo_name   = var.repo_name
  owner_name  = var.owner_name
}
