provider "aws" {
  region = "us-east-1"
}

variable "name" {}
variable "env" {}
variable "team" {}
variable "key_name" {}
variable "account_id" {}
variable "cf_aliases" {
        type = "list"
        default = [""]
}
variable "domain" {
		default = ""
}

variable routing_rules {
    default = ""
}

variable viewer_protocol_policy {
    default = "allow-all"
}

variable origin_protocol_policy {}

variable cloudfront_default_certificate {
    default = ""
}
    
variable acm_certificate_arn {
    default = ""
}

variable minimum_protocol_version {
    default = "SSLv3"
}

variable ssl_support_method {
    default = "sni-only"
}

variable cloudfront_compress {
    default = "true"
}