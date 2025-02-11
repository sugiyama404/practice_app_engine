resource "google_project_iam_member" "cloud_run_sa_user" {
  for_each = toset([
    "roles/logging.logWriter",
    "roles/logging.viewer",
    "roles/storage.admin",
    "roles/cloudbuild.builds.editor",
    "roles/artifactregistry.reader",
    "roles/artifactregistry.writer",
    "roles/iam.securityAdmin",
    "roles/storage.objectAdmin",
  ])
  role    = each.key
  project = var.project_id
  member  = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}
