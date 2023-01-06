variable "default_region" {
  type    = string
  default = "asia-northeast-1"
}

variable "project_id" {
  type      = string
  sensitive = true
}

variable "location" {
  type = string
}

variable "branch_name" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "owner_name" {
  type = string
}
