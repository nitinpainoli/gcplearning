variable "name" {
  type        = string
  description = "name of the compute instance"
  default     = "bastion"
}


variable "project_name" {
  type    = string
  description = "project name"
 
}

variable "disk_size_gb" {
  description = "Boot disk size in GB"
  default     = 100
}


variable "machine_type" {
  type        = string
  description = "Machine Type"
  default     = "e2-medium"
}


variable "zone" {
  type        = string
  description = "zone where machine will create"
  default     = "us-central1-a"
}

variable "image" {
  type = string
  description = "image name"
  default = "ubuntu-2004-lts"
  
}

variable "static_ip" {
  
}


variable "subnetname" {
  type = string
  description = "subnet name"
  
  
}

variable "ssh_user" {
  default = "ubuntu"
}


