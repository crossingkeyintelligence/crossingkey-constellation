resource "oci_core_instance" "studio_node" {
  display_name = "CrossingKey_Studio_Compute"
  shape        = "VM.Standard.A1.Flex" # Always Free Ampere
  # OCI Infrastructure Logic...
}

resource "google_cloud_run_v2_service" "render_engine" {
  name     = "cinematic-render-node"
  location = "us-central1"
  # GCP Elastic Rendering Logic...
}
