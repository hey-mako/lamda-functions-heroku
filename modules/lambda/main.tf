resource "aws_lambda_function" "lambda_function" {
  description   = "${var.description}"
  filename      = "${var.filename}"
  function_name = "${random_pet.pet.id}"
  handler       = "${var.handler}"
  memory_size   = "${var.memory_size}"
  role          = "${var.role}"
  runtime       = "${var.runtime}"
  tags          = "${var.tags}"
  timeout       = "${var.timeout}"
}

resource "random_pet" "pet" {}
