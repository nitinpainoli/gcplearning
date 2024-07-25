resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project = local.workspace.project_name
  service = each.key
  disable_dependent_services=true
  disable_on_destroy = false
}


module "vpc" {
  source = "../../modules/vpc"
  project_name = local.workspace.project_name
  
}