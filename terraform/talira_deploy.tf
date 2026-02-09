resource "google_artifact_registry_repository" "talira_repo" {
  location      = "us-central1"
  repository_id = "talira-vision"
  description   = "Docker repository for Talira Sensory Core"
  format        = "DOCKER"
}

resource "google_cloud_run_service" "talira_api" {
  name     = "talira-core"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/${var.project_id}/talira-vision/core:v1.2"
        env {
          name  = "RESONANCE_TARGET"
          value = "0.9997"
        }
      }
    }
  }
}
