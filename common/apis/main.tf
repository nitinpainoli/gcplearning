resource "google_project_service" "gcp_services" {
  for_each = toset(local.workspace.gcp_service_list)
  project = local.workspace.project_name
  service = each.key
  disable_dependent_services=true
  disable_on_destroy = true
}


