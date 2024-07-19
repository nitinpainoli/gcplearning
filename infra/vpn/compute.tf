data "template_file" "user_data" {
  template = file("${path.module}/pritunl.sh")
}

module "compute" {
    source = "../../modules/compute"
    machine_type = local.workspace.compute.machine_type
    zones         = local.workspace.compute.zones
    image = local.workspace.compute.image
    disk_size_gb = local.workspace.compute.disk_size_gb
    subnetname = local.workspace.compute.subnetname    
    project_name = local.workspace.compute.project_name
    common_labels = local.workspace.common_labels
    networktag  = local.workspace.compute.networktag
    metadata_startup_script = base64encode(data.template_file.user_data.rendered)
}