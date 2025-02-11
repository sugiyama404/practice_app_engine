resource "google_storage_bucket_iam_member" "storage_object_viewer" {
  bucket = google_storage_bucket.fun_bucket.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${var.service_account_email}"
}

resource "google_storage_bucket_iam_member" "build_bucket" {
  bucket = "staging.${var.project_id}.appspot.com"
  role   = "roles/storage.admin"
  member = "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
}
