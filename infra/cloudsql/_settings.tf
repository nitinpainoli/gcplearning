terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.36.0"
    }
  }

  backend "gcs" {
   bucket  = "gcp-tf-gcplearning24-backend"
   prefix  = "database/main.tf"
 }
}


provider "google" {
  project     = "gcplearning24"
  region      = "us-central1"
}


locals {
  env_space = yamldecode(file("../../config-${terraform.workspace}.yml"))
  workspace = local.env_space
}
