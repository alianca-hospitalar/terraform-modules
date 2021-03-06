provider "aws" {
  region = "us-east-1"
}

/***** Common variables *****/

variable "environment" {
  default = "production"
  description = "Type of the environment where the resources will be created. (e.g. production, qa (quality assurance), etc.)"
}

variable "system" {
  description = "Name of the system that owns this resources"
}

/***** S3 variables *****/

variable "name" {}
variable "type" {}
variable "env" {}
variable "team" {}
variable "account_id" {}
variable "s3_bucket_name" {}
variable "s3_acl" {}
variable "s3_versioning" {}
