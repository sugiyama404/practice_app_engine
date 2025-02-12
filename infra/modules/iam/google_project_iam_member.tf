resource "google_project_iam_member" "appengine_sa_iam" {
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

resource "google_project_iam_member" "sa_admin" {
  for_each = toset([
    "roles/storage.objectViewer",
    "roles/appengine.deployer",
  ])
  role    = each.key
  project = var.project_id
  member  = "serviceAccount:${google_service_account.main.email}"
}
