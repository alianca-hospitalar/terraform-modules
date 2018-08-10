resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.s3_bucket_name}"
  acl    = "${var.s3_acl}"
  lifecycle {
    prevent_destroy = false
  }

  force_destroy = true
  
  tags {
        Name = "${var.name}"
        Environment = "${var.env}"
    } 

  versioning {
    enabled = "${var.s3_versioning}"
  }
}