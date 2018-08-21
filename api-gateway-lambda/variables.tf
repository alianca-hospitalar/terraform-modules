/***** Common variables *****/

variable "environment" {
  default = "production"
  description = "Type of the environment where the resources will be created. (e.g. production, qa (quality assurance), etc.)"
}

variable "system" {
  description = "Name of the system that owns this resources"
}

/***** API Gateway variables *****/
variable request_templates {
  default = {}
}

variable http_method {
  description = "Environment HTTP method"
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
