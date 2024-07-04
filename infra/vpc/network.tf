module "vpc" {
  source = "./modules/vpc"
  null_var = values(google_project_service.gcp_services)[*].id
  project_name = local.workspace.compute.project_name
  
}