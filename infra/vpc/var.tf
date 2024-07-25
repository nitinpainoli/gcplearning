variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [
    
    "cloudresourcemanager.googleapis.com", 
    "serviceusage.googleapis.com",
    "compute.googleapis.com",
    "sqladmin.googleapis.com",
    "networkmanagement.googleapis.com",
     "container.googleapis.com",
     "logging.googleapis.com",
     "monitoring.googleapis.com",
     "storage.googleapis.com",    
     "cloudapis.googleapis.com" ,
     "servicenetworking.googleapis.com",
     "iam.googleapis.com"

  ]
}