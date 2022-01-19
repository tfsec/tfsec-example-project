data "aws_s3_bucket" "logging_bucket" {
  bucket = var.s3_logging_bucket
}

resource "aws_s3_bucket" "acme_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  logging {
    target_bucket = data.aws_s3_bucket.logging_bucket.id
    target_prefix = format("%s/logs/", var.bucket_name)
  }

}