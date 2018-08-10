provider "aws" {
  region = "us-east-1"
}

variable "name" {}
variable "type" {}
variable "env" {}
variable "team" {}
variable "account_id" {}
variable "s3_bucket_name" {}
variable "s3_acl" {}
variable "s3_versioning" {}