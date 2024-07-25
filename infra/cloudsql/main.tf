module "cloudsql" {
   source = "../../modules/cloudsql"
   network_name = data.terraform_remote_state.vpc.outputs.name
   vpc_id = data.terraform_remote_state.vpc.outputs.id
   self = data.terraform_remote_state.vpc.outputs.vpc_self
   project_name = local.workspace.project_name
   db_instance_name = local.workspace.db.db_instance_name
   database_version = local.workspace.db.database_version
}