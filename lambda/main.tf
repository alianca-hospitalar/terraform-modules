resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.lambda_function_name}"
  s3_bucket     = "${var.s3_bucket}"
  s3_key        = "${var.s3_key}"
  runtime       = "${var.runtime}"
  timeout       = "${var.timeout}"
  memory_size   = "${var.memory_size}"
  role          = "${var.role}"
  handler       = "${var.handler}"

  environment {
    variables = "${var.environment_variables}"
  }
}

resource "aws_lambda_permission" "lambda_function_permission" {
  function_name = "${aws_lambda_function.lambda_function.arn}"
  statement_id  = "${var.statement_id}"
  action        = "${var.action}"
  principal     = "${var.principal}"
  source_arn    = "${var.source_arn}"
}

output "output_lambda_function_arn" {
  value = "${aws_lambda_function.lambda_function.invoke_arn}"
}
