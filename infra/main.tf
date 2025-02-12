terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.85.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# IAM
module "iam" {
  source     = "./modules/iam"
  project_id = var.project_id
  region     = var.region
}

# Arifact Registry
module "arifactregistry" {
  source                = "./modules/artifactregistry"
  project_id            = var.project_id
  region                = var.region
  service_account_email = module.iam.service_account_email
}

# Cloud Strorage
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
