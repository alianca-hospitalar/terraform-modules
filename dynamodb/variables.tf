provider "aws" {
  region = "us-east-1"
}

variable "name" {}
variable "type" {}
variable "env" {}
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