output "id" {
  description = "value"
  value = google_compute_network.vpc_network.id
}

output "vpc_self" {
   
  value = google_compute_network.vpc_network.self_link
}

output "subnetwork_self" {
  
    
  value = google_compute_subnetwork.PrivateGKE.self_link
}


output "name" {
  value = google_compute_network.vpc_network.name
}

output "subnetname" {
  description = "value"
  value = google_compute_subnetwork.Public.name
}


output "subnetnamedb" {
  description = "value"
  value = google_compute_subnetwork.PrivateDB.name
}


output "subnetnamegke" {
  description = "value"
  value = google_compute_subnetwork.PrivateApp.name
}


output "cluster_secondary_range" {
  value =  google_compute_subnetwork.PrivateApp.ip_cidr_range
}
output "cluster_service_range" {
  value = google_compute_subnetwork.PrivateApp.ip_cidr_range
}


output "nat_ip" {
   value =  google_compute_address.static.address
}