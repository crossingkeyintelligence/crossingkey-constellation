# PROVIDER: OCI (Always Free Ampere)
resource "oci_core_instance" "constellation_hub" {
  availability_domain = "ad-1"
  compartment_id      = var.compartment_id
  display_name        = "CrossingKey_Hub_Alpha"
  shape               = "VM.Standard.A1.Flex"
  
  shape_config {
    memory_in_gbs = 24
    ocpus         = 4
  }
}

# PROVIDER: GCP (Elastic Inference)
resource "google_cloud_run_service" "inference_engine" {
  name     = "crossingkey-inference"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/crossingkey/inference-lite:latest"
        resources {
          limits = {
            cpu    = "1"
            memory = "512Mi"
          }
        }
      }
    }
  }
}
