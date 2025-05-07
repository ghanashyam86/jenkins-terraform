module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "ghana1-terraform-remote-state-bucket"
  acl    = "private"
  block_public_acls = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}
