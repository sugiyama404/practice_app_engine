resource "google_project_service" "appengine_api" {
  project = var.project_id
  service = "appengine.googleapis.com"
}
