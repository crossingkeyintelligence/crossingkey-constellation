# OCI PROVIDER FOR PERMANENT HUB
resource "oci_core_instance" "gate_hub" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_ocid
  display_name        = "CrossingKey_Hub"
  shape               = "VM.Standard.A1.Flex"
  
  shape_config {
    memory_in_gbs = 24
    ocpus         = 4
  }
}

# GCP PROVIDER FOR ELASTIC INFERENCE
resource "google_cloud_run_service" "inference_engine" {
  name     = "crossingkey-inference"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello" # Replace with your inference container
      }
    }
  }
}
