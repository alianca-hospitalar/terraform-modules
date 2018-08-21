/***** Common variables *****/

variable "environment" {
  default = "production"
  description = "Type of the environment where the resources will be created. (e.g. production, qa (quality assurance), etc.)"
}

variable "system" {
  description = "Name of the system that owns this resources"
}

/***** AWS Lambda variables *****/
variable lambda_function_name {
  description = "Lambda function name definition"
}

variable s3_bucket {
  description = "S3 Bucket where lambda function is located"
}

variable s3_key {
  description = "S3 folder / key where the lambda sources are located"
}

variable runtime {
  description = "Runtime where lambda function is executed"
}

variable role {
  description = "AWS IAM role used for this lambda"
}

variable timeout {
  default = "30"
}

variable memory_size {
  default="512"
}

variable principal {
  description = "Event for call lambda function"
  default = "apigateway.amazonaws.com"
}

variable statement_id {
  description = "Lambda permission statement_id"
  default = "AllowExecutionFromApiGateway"
}

variable handler {
  description = "Lambda function handler (Ex: index.handler)"
  default = "index.handler"
}

variable environment_variables {
  description = "Environment variables used in Lambda execution"
  default = {
    DEFAULT=""
  }
}

variable action {
  description = "Action which must be permitted in AWS permission rules"
  default = "lambda:InvokeFunction"
}

variable source_arn {}
