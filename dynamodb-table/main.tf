resource "aws_dynamodb_table" "dynamodb_table" {
  name           = "${var.name}-${var.env}"
  read_capacity  = "${var.dynamodb_read_capacity}"
  write_capacity = "${var.dynamodb_write_capacity}"
  hash_key       = "${var.dynamodb_hash_key}"

  attribute {
    name = "${var.attribute_name}"
    type = "${var.attribute_type}"
  }

  tags {
    Environment = "${var.environment}"
    System = "${var.system}"
  }
}
