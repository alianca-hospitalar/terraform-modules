resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = "${var.rest_api_id}"
  parent_id   = "${var.parent_id}"
  path_part   = "${var.path_part}"
}

resource "aws_api_gateway_method" "api_gateway_post" {
  rest_api_id   = "${var.rest_api_id}"
  resource_id   = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method   = "${var.http_method}"
  authorization = "${var.authorization}"
}

resource "aws_api_gateway_integration" "api_gateway_integration" {
  rest_api_id             = "${var.rest_api_id}"
  resource_id             = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method             = "${aws_api_gateway_method.api_gateway_post.http_method}"
  integration_http_method = "POST"
  type                    = "${var.integration_type}"
  uri                     = "${var.uri}"
  request_templates       = "${var.request_templates}"
}

resource "aws_api_gateway_method_response" "api_gateway_method_response" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method = "${aws_api_gateway_method.api_gateway_post.http_method}"
  status_code = "${var.status_code}"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true
    "method.response.header.Access-Control-Allow-Methods" = true
    "method.response.header.Access-Control-Allow-Origin"  = true
  }
}

resource "aws_api_gateway_integration_response" "api_gateway_integration_response" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method = "${aws_api_gateway_method.api_gateway_post.http_method}"
  status_code = "${aws_api_gateway_method_response.api_gateway_method_response.status_code}"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
    "method.response.header.Access-Control-Allow-Methods" = "'${var.http_method},OPTIONS'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }
}

resource "aws_api_gateway_method" "api_gateway_options" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method = "OPTIONS"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "api_gateway_integration_options" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method = "${aws_api_gateway_method.api_gateway_options.http_method}"
  type = "MOCK"
  request_templates = {
    "application/json" = <<PARAMS
  { "statusCode": 200 }
  PARAMS
   }
}

resource "aws_api_gateway_method_response" "api_gateway_method_response_options" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method = "${aws_api_gateway_method.api_gateway_options.http_method}"
  status_code = "200"
  response_models = { "application/json" = "Empty" }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = true,
    "method.response.header.Access-Control-Allow-Methods" = true,
    "method.response.header.Access-Control-Allow-Origin" = true
  }
}

resource "aws_api_gateway_integration_response" "api_gateway_integration_response_options" {
  rest_api_id = "${var.rest_api_id}"
  resource_id = "${aws_api_gateway_resource.api_gateway_resource.id}"
  http_method = "${aws_api_gateway_method.api_gateway_options.http_method}"
  status_code = "${aws_api_gateway_method_response.api_gateway_method_response_options.status_code}"
  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'",
    "method.response.header.Access-Control-Allow-Methods" = "'${var.http_method},OPTIONS'",
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}
