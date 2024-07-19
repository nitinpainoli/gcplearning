terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.36.0"
    }
  }
}

provider "google" {
  project     = "gcplearning24"
  region      = "us-central1"
}
resource "google_compute_global_address" "cdn_ip" {
  name = "cdn-ip"
}

resource "google_compute_backend_bucket" "s3_backend" {
  name        = "s3-backend"
  bucket_name = "gcptestcdntest"

  enable_cdn = true

  cdn_policy {
    cache_mode       = "CACHE_ALL_STATIC"
    default_ttl      = 3600
    max_ttl          = 86400
    negative_caching = true

    negative_caching_policy {
      code = 404
      ttl  = 1800
    }
  }
}

resource "google_compute_url_map" "cdn_url_map" {
  name            = "cdn-url-map"
  default_service = google_compute_backend_bucket.s3_backend.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = "path-matcher"
  }

  path_matcher {
    name            = "path-matcher"
    default_service = google_compute_backend_bucket.s3_backend.self_link

    path_rule {
      paths   = ["/test"]
      service = google_compute_backend_bucket.s3_backend.self_link
    }

   
  }
}

resource "google_compute_target_http_proxy" "cdn_http_proxy" {
  name    = "cdn-http-proxy"
  url_map = google_compute_url_map.cdn_url_map.self_link
}

resource "google_compute_global_forwarding_rule" "cdn_forwarding_rule" {
  name       = "cdn-forwarding-rule"
  ip_address = google_compute_global_address.cdn_ip.address
  port_range = "80"
  target     = google_compute_target_http_proxy.cdn_http_proxy.self_link
}

