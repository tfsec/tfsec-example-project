data "aws_s3_bucket" "logging_bucket" {
  bucket = var.s3_logging_bucket
}

#tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket" "acme_bucket" {
  bucket = var.bucket_name
  acl    = "private"
  logging {
    target_bucket = data.aws_s3_bucket.logging_bucket.id
    target_prefix = format("%s/logs/", var.bucket_name)
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_security_group" "bastion" {
  name        = "bastion_sg"
  description = "bastion_sg"
}