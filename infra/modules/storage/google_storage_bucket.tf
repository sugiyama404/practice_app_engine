resource "google_storage_bucket" "fun_bucket" {
  name     = "fun-bucket-tf-${random_string.storage_unique_key.result}"
  location = var.region
}

# resource "google_storage_bucket" "build_bucket" {
#   name     = "staging.${var.project_id}.appspot.com"
#   location = var.region
# }

resource "random_string" "storage_unique_key" {
  length  = 10
  upper   = false
  lower   = true
  numeric = true
  special = false
}
