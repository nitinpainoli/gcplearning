provider "google" {
  project     = "gcplearning24"
  region      = "us-central1"
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project = var.project_name
  service = each.key
  disable_dependent_services=true
  disable_on_destroy = false
}
