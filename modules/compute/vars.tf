# variable "service_account_email" {
#   default = "nitinfulltf@nypoc-318209.iam.gserviceaccount.com"
# }

variable networktag {
  type        = string
  default     = ""
  description = "description"
}

variable "project_name" {
  type    = string
  description = "project name"
  default = "gcplearning24"
}

variable "common_labels" {

}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  
}


variable "machine_type" {
  type        = string
  description = "Machine Type"
  default     = "e2-medium"
}

variable "zones" {
  

}

variable "image" {
  type = string
  description = "image name"
  
}



variable "subnetname" {
  type = string
  description = "subnet name"
  
  
}
variable "ssh_user" {
  default = "ubuntu"
}


variable metadata_startup_script {
}
