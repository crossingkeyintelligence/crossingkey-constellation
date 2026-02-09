# Deploying Local Edge Hubs via OCI Distributed Cloud
resource "oci_core_instance" "edge_node" {
  count               = 3
  display_name        = "CrossingKey_Edge_${count.index}"
  shape               = "VM.Standard.A1.Flex"
  # Optimized for 2026 Small Language Models (SLMs)
  shape_config {
    memory_in_gbs = 12
    ocpus         = 2
  }
}
