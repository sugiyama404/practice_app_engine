resource "google_app_engine_standard_app_version" "app" {
  service    = "default"
  version_id = "v1"

  runtime = "python312"
  entrypoint {
    shell = "gunicorn -b :$PORT main:app"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${var.storage_bucket_fun_bucket_name}/index.zip"
    }
  }

  automatic_scaling {
    standard_scheduler_settings {
      max_instances = 1
    }
  }
  delete_service_on_destroy = true
}
