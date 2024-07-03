provider "google" {
  project     = "gcplearning24"
  region      = "us-central1"
}
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}


resource "google_compute_instance" "vm" {
  name         = "${var.project_name}-${terraform.workspace}-vm"
  machine_type = var.machine_type
  zone         = var.zones
  project      = var.project_name
  tags         = [var.networktag]
  

  labels = merge(
    var.common_labels,
    {
      Name        = "${var.project_name}-${terraform.workspace}-vm"
    }
  )

  

  boot_disk {
    initialize_params {
      image = var.image
      size = var.disk_size_gb
      
    }
  }
  
  network_interface {
     subnetwork = var.subnetname    

  }
   metadata = {
    ssh-keys        = "${var.ssh_user}:tls_private_key.ssh_key.public_key_openssh"
      } 
}

