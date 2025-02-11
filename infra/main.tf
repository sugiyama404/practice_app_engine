terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# iam
module "iam" {
  source                                 = "./modules/iam"
  project_id                             = var.project_id
  region                                 = var.region
  compute_engine_default_service_account = var.compute_engine_default_service_account
}

# strorage
module "storage" {
  source                = "./modules/storage"
  service_account_email = module.iam.service_account_email
  region                = var.region
  project_number        = var.project_number
  project_id            = var.project_id
}

#APP Engine
module "appengine" {
  source                         = "./modules/appengine"
  project_id                     = var.project_id
  region                         = var.region
  storage_bucket_fun_bucket_name = module.storage.storage_bucket_fun_bucket_name
}
