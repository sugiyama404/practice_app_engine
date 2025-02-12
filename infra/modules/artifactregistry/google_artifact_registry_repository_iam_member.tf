resource "google_artifact_registry_repository_iam_member" "repo_writer" {
  repository = google_artifact_registry_repository.app_engine_tmp.name
  location   = google_artifact_registry_repository.app_engine_tmp.location
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${var.service_account_email}"
}

resource "google_artifact_registry_repository_iam_member" "app_engine_reader" {
  repository = google_artifact_registry_repository.app_engine_tmp.name
  location   = google_artifact_registry_repository.app_engine_tmp.location
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}
