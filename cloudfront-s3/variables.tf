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

/***** S3 settings variables *****/

variable "s3_bucket" {
  description = "Name of the S3 bucket with the sources that will be exposed in the Cloudfront CDN"
}

variable "s3_acl" {
  default = "public-read"
  description = "ACL rules for the S3 bucket exposed to Cloudfront"
}

variable s3_routing_rules {
  default = ""
  description = "Routing rules that will be used in S3"
}

/***** Cloudfront variables *****/

variable cf_origin_protocol_policy {
  description = "The origin protocol policy to apply to your cloudfront origin. The possible values are: http-only, https-only, or match-viewer"
}

variable "cf_aliases" {
  type = "list"
  default = []
  description = "Extra CNAMEs (alternate domain names), if any, for this Cloudfront distribution"
}

variable cf_compress {
  default = "true"
  description = "Tell to Cloudfront if you want that the web requests have its data automatically compressed when a request header 'Accept-Encoding: gzip' is found"
}

variable cf_viewer_protocol_policy {
  default = "allow-all"
  description = "Specify the protocol that users can use to access the files in the origin. Possible values: allow-all, https-only, or redirect-to-https"
}

variable cf_default_certificate {
  default = ""
  description = "Flag indicating if the default Cloudfront certificate must be used"
}

variable cf_acm_certificate_arn {
  default = ""
  description = "ARN of the ACM certificate to be used in this CDN"
}

variable cf_minimum_protocol_version {
  default = "SSLv3"
  description = "Minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections"
}

variable cf_ssl_support_method {
  default = "sni-only"
  description = "Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only."
}
