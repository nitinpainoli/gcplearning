resource "google_compute_network" "vpc_network" {
  name = "${terraform.workspace}-${var.name}"
  auto_create_subnetworks = var.auto_create_subnetworks
  project = var.project_name
  routing_mode = "GLOBAL"  
  timeouts {
    create = "60m"
    delete = "2h"
  }
 
}

resource "google_compute_subnetwork" "Public" {
    name            =  "${terraform.workspace}-${var.subnetworkpublic}"
    ip_cidr_range   =  var.subnet_ip_public
    region          =  var.region
    network         =  google_compute_network.vpc_network.name
    project         =  var.project_name
    private_ip_google_access = true
   
    depends_on = [google_compute_network.vpc_network]
}

module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  project_id   = var.project_name
  network_name = google_compute_network.vpc_network.name

  rules = [{
    name                    = "${terraform.workspace}-allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]


}


resource "google_compute_subnetwork" "PrivateDB" {
    name = "${terraform.workspace}-${var.subnetworkprivatedb}"  
    ip_cidr_range = var.subnet_ip_db
    region = var.region
    network     = google_compute_network.vpc_network.name
    project     = var.project_name
    private_ip_google_access = true
   
    depends_on = [google_compute_network.vpc_network]
}  

resource "google_compute_subnetwork" "PrivateApp" {
    name = "${terraform.workspace}-${var.subnetworkprivategke}"  
    ip_cidr_range = var.subnet_ip_app
    region = var.region
    network     = google_compute_network.vpc_network.name
    project     = var.project_name
    private_ip_google_access = true
   
  #     secondary_ip_range = [
  #   {
  #     range_name    = var.cluster_secondary_name
  #     ip_cidr_range = var.cluster_secondary_range
  #   },
  #   {
  #     range_name    = var.cluster_service_name
  #     ip_cidr_range = var.cluster_service_range
  #   }
  # ] 
    depends_on = [google_compute_network.vpc_network]

}  


resource "google_compute_address" "nat" {
  name    = var.nat_name
  project = var.project_name
  region  = var.region
}

resource "google_compute_router" "router" {
  name    =  var.nat_name
  project = var.project_name
  region  = var.region
  network = google_compute_network.vpc_network.self_link
}

resource "google_compute_router_nat" "nat" {
  name    = format("%s-cloud-nat", var.nat_name)
  project = var.project_name
  router  = google_compute_router.router.name
  region  = var.region
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = [google_compute_address.nat.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

}

resource "google_compute_address" "static" {
  name = "ipv4-address"
  project = var.project_name
  region  = var.region
}


