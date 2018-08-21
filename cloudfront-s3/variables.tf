provider "aws" {
  region = "us-east-1"
}

/***** Common variables *****/

/* Type of the environment where the resources will be created. (e.g. production, qa (quality assurance), etc.) */
variable "environment" {
  default = "production"
}

/* Name of the system that owns this resources */
variable "system" {}

/***** S3 settings variables *****/

/* Name of the S3 bucket with the sources that will be exposed in the Cloudfront CDN */
variable "s3_bucket" {}

/* ACL rules for the S3 bucket exposed by Cloudfront */
variable "s3_acl" {
  default = "public-read"
}

/* Routing rules that will be used */
variable s3_routing_rules {
    default = ""
}

/***** Cloudfront variables *****/

/* The origin protocol policy to apply to your cloudfront origin. The possible values are: http-only, https-only, or match-viewer */
variable cf_origin_protocol_policy {}

/* Extra CNAMEs (alternate domain names), if any, for this Cloudfront distribution */
variable "cf_aliases" {
  type = "list"
  default = []
}

/* Tell to Cloudfront if you want that the web requests have its data automatically compressed when a request header "Accept-Encoding: gzip" is found  */
variable cf_compress {
  default = "true"
}

/* Specify the protocol that users can use to access the files in the origin. Possible values: allow-all, https-only, or redirect-to-https */
variable cf_viewer_protocol_policy {
  default = "allow-all"
}

/* Flag indicating if the default Cloudfront certificate must be used */
variable cf_default_certificate {
  default = ""
}

/* ARN of the ACM certificate to be used in this CDN */
variable cf_acm_certificate_arn {
    default = ""
}

/* Minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections */
variable cf_minimum_protocol_version {
    default = "SSLv3"
}

/* Specifies how you want CloudFront to serve HTTPS requests. One of vip or sni-only */
variable cf_ssl_support_method {
    default = "sni-only"
}
