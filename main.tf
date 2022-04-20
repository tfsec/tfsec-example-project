module "acme_finance_bucket" {
  source      = "./modules/acme_bucket"
  bucket_name = "finance-reports"
  cost_centre = "CC001"

  s3_logging_bucket = var.acme_s3_logging_bucket
}
