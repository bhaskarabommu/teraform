module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = format("my-app-%s-s3-bucket-456645", var.environment)
  environment = var.environment
}