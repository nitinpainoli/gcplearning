variable "vpc_id" {
  type = string
  description = "id of vpc"
  
  
}

variable "network_name" {

  
}

variable "self" {
  type = string
  description = "self"
  
}
variable "project_name" {
  type        = string
  description = "The project ID to manage the Cloud SQL resources"
}

variable "db_instance_name" {
  type        = string
  description = "The name of the Cloud SQL resources"
 
}


variable "database_version" {
  description = "The database version to use"
  type        = string
  default = "POSTGRES_10"
}

variable "region" {
  type        = string
  description = "The region of the Cloud SQL resources"
  default     = "us-central1"
}



variable "zone" {
  type        = string
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  default = "us-central1-c"
}


variable "availability_type" {
  description = "The availability type for the master instance.This is only used to set up high availability for the PostgreSQL instance. Can be either `ZONAL` or `REGIONAL`."
  type        = string
  default     = "ZONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size."
  type        = bool
  default     = true
}


variable "disk_size" {
  description = "The disk size for the master instance."
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  default     = "PER_USE"
}


variable "db_name" {
  description = "The name of the default database to create"
  type        = string
  default     = "dev"
}


variable "deletion_protection" {
  description = "Used to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = false
}


variable "db_password" {
  description = "Password for the pwc Postgres user"
  default     = ""
}