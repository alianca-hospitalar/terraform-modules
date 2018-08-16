variable lambda_function_name {
    description = "Lambda function name definition"
}

variable s3_bucket {
    description = "S3 Bucket where lambda function is located"
}

variable s3_key {
    description = "S3 folder / key where the lambda sources are located"
}

variable env {
    description = "System environment (prod for production or homolog for homologation)"
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
    description = "Action which must be tod"
    default = "lambda:InvokeFunction"
}

variable source_arn {}
