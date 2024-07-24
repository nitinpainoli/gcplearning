data "terraform_remote_state" "vpc" {
  backend = "gcs"
  workspace = terraform.workspace
  config = {
    bucket = "gcp-tf-gcplearning24-backend"
    prefix = "vpc/main.tf"
  }
}
