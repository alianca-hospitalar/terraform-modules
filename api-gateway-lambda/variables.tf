variable request_templates {
  default = {}
}

variable http_method {
  description = "Environment http method"
}

variable path_part {
  description = "Endpoint destination"
}

variable description {}

variable lambda_function {
  description = "This AWS Lambda function"
}

variable rest_api_id {}
variable parent_id {}

variable authorization {
  default = "NONE"
}

variable uri {}

variable status_code {
  default = "200"
}

variable stage_name {}

variable integration_type {
  default = "AWS_PROXY"
}
