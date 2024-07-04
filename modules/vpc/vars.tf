variable "name" {
     description = "name of vpc"
     type = string
  
}

variable  "nat_name" {
  
}

variable "project_name" {
  type        = string
  description = "name of project"
}



variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}



variable "region" {
  description = "region of subnet"
  type = string
  default = "us-central1"
}

variable "subnetworkpublic" {
     description = "name of public subnet"
     type = string
     default = "publicnew"
  
}


variable "subnetworkprivatedb" {
     description = "name of privatesubnet db subnet"
     type = string
     default = "privatedbnew"
  
}

variable "subnetworkprivategke" {
     description = "name of privatesubnet gke subnet"
     type = string
     default = "privategke"
  
}



variable "subnet_ip_public" {
     description = "cidr range for public subnet"
     type = string
     default = "10.0.1.0/24"
  
}



variable "subnet_ip_db" {
     description = "cidr range for db subnet"
     type = string
     default = "10.0.10.0/24"
  
}



variable "subnet_ip_app" {
     description = "cidr range for private subnet"
     type = string
     default = "10.0.2.0/24"
  
}




# variable "cluster_secondary_name"{
# }

# variable "cluster_service_name"{
# }

# variable "cluster_secondary_range"{
#   default = "10.4.0.0/14"
# }

# variable "cluster_service_range"{
#   default = "10.0.32.0/20"
# }

