resource "aws_s3_bucket" "s3_bucket" {
    bucket = "static-${var.name}-${var.env}"
    acl = "${var.s3_acl}"
    lifecycle {
      prevent_destroy = false
    }
    force_destroy = true
    cors_rule {
        allowed_headers = ["Authorization"]
        allowed_methods = [ "GET" ]
        allowed_origins = ["*"]
    }
    website {
      index_document = "index.html"
      error_document = "index.html"
      routing_rules = "${var.routing_rules}"
    }
    tags {
        Name = "${var.name}"
        Environment = "${var.env}"
    }
}

resource "aws_cloudfront_distribution" "cloudfront_distribution" {
  depends_on = [ "aws_s3_bucket.s3_bucket" ]
  origin {
    domain_name = "${aws_s3_bucket.s3_bucket.website_endpoint}"
    origin_id   = "static-${var.name}-${var.env}-dist-id"
    custom_origin_config {
      http_port = 80
      https_port = 443
      origin_protocol_policy = "${var.origin_protocol_policy}"
      origin_ssl_protocols = [ "SSLv3", "TLSv1" ]
    }
  }
  enabled             = true
  comment             = "Built via terraform"
  default_root_object = "index.html"
  aliases = [ "${var.cf_aliases}" ]
  default_cache_behavior {
    allowed_methods  = [ "HEAD", "DELETE", "POST", "GET", "OPTIONS", "PUT", "PATCH" ]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "static-${var.name}-${var.env}-dist-id"
    compress = "${var.cloudfront_compress}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "${var.viewer_protocol_policy}"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

  viewer_certificate {
    cloudfront_default_certificate = "${var.cloudfront_default_certificate}"
    acm_certificate_arn = "${var.acm_certificate_arn}"
    minimum_protocol_version = "${var.minimum_protocol_version}"
    ssl_support_method = "${var.ssl_support_method}"
  }
}
