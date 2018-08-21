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

/***** DynamoDB table variables *****/
variable "name" {}
variable "type" {}
variable "team" {}
variable "account_id" {}
variable "domain" {
		default = ""
}
variable "dynamodb_read_capacity" {}
variable "dynamodb_write_capacity" {}
variable "dynamodb_hash_key" {}
variable "attribute_name" {}
variable "attribute_type" {}
