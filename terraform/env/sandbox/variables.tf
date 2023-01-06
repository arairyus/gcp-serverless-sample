variable "default_region" {
  type    = string
  default = "asia-northeast-1"
}

variable "project_id" {
  type      = string
  sensitive = true
}

variable "service_list" {
  type = list(string)
}

variable "repo_name" {
  type = string
}

variable "default_location" {
  type    = string
  default = "asia-northeast1"
}
