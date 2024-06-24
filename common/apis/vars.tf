
variable "gcp_service_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
  default = [

    "compute.googleapis.com",
    "networkmanagement.googleapis.com",
     "cloudapis.googleapis.com" ,
     "iam.googleapis.com"

  ]
}

variable project_name {
  type        = string
  default     = "gcplearning24"
  description = "project name"
}
