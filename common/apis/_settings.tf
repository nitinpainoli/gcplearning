provider "google" {
  project     = "gcplearning24"
  region      = "us-central1"
}

locals {
  env_space = yamldecode(file("../config.yaml"))
  workspace = local.env_space
}