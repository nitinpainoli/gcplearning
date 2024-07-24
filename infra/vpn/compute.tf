module "bastion" {
  source = "../../modules/pritunl"
  project_name = local.workspace.project_name
  machine_type = local.workspace.vpn.machine_type
  image = local.workspace.vpn.image
  disk_size_gb = local.workspace.vpn.disk_size_gb
  subnetname = data.terraform_remote_state.vpc.outputs.subnetname
  static_ip = data.terraform_remote_state.vpc.outputs.nat_ip
  zone  = local.workspace.vpn.zone

}
