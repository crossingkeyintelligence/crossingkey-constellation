# OCI - Persistent Logic Node (Always Free)
resource "oci_core_instance" "studio_brain" {
  display_name = "CrossingKey_Brain_Node"
  shape        = "VM.Standard.A1.Flex" # Ampere
  # OCI details...
}

# GCP - Elastic Rendering Farm (GPU Scaling)
resource "google_compute_instance_group_manager" "render_farm" {
  name               = "crossingkey-render-farm"
  base_instance_name = "render-node"
  zone               = "us-central1-a"
  target_size        = 10 # Scalable to 1000+ for 0M production
  # GCP L4 GPU logic...
}
