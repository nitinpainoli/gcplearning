provider "google" {
  project     = "gcplearning24"
  region      = "us-central1"
}
resource "tls_private_key" "ssh_key_bastion" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}


resource "google_compute_instance" "bastion" {
  name         = "${var.project_name}-${terraform.workspace}-${var.name}"
  machine_type = var.machine_type
  zone         = var.zone
  
  project = var.project_name
  tags  = ["bastion"]
   labels = {
    environment = "${terraform.workspace}"
    project = "${var.project_name}"
    name = "${var.project_name}-${terraform.workspace}-${var.name}"
    managedby = "terraform"

  }
 

  boot_disk {
    initialize_params {
      image = var.image
      size = var.disk_size_gb
      
    }
  }
  network_interface {
     subnetwork = var.subnetname    
    access_config {
      nat_ip = var.static_ip
    }
  }
   metadata = {
    ssh-keys        = "${var.ssh_user}:tls_private_key.ssh_key_bastion.public_key_openssh"
    startup-script  = file("./startup-script")
    } 
}