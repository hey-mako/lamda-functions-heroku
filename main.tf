provider "aws" {}

resource "aws_iam_role" "iam_role" {
  assume_role_policy = <<EOF
{
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:*"
    }
  ],
  "Version": "2012-10-17"
}
EOF
}

module "lambda" {
  source = "modules/lambda"

  filename = "${file("${path.module}/resources/get.py")}"
  role     = "${aws_iam_role.iam_role.arn}"
  handler  = "${var.handler}"
  runtime  = "${var.runtime}"
}
