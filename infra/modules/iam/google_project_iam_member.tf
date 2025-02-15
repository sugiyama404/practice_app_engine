resource "google_project_iam_member" "appengine_sa_iam" {
  for_each = toset([
    "roles/logging.logWriter",
    "roles/logging.viewer",
    "roles/logging.viewAccessor",
    "roles/storage.admin",
    "roles/cloudbuild.builds.editor",
    "roles/artifactregistry.admin",
    "roles/iam.securityAdmin",
    "roles/storage.objectAdmin",
    "roles/appengine.serviceAdmin",
    "roles/compute.storageAdmin",
    "roles/iam.serviceAccountUser",
    "roles/appengine.appCreator",
    "roles/appengine.appAdmin",
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
