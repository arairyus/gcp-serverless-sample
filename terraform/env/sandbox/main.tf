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

module "service_api" {
  source           = "../../modules/project_service"
  project_id       = var.project_id
  gcp_service_list = var.service_list
}

#module "gha" {
#  source     = "../../modules/gha"
#  project_id = var.project_id
#}

module "hellowold_repo" {
  source    = "../../modules/artifact_registory"
  location  = var.default_location
  repo_name = var.repo_name
}
