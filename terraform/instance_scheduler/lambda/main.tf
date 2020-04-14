data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}

resource "aws_lambda_function" "lambda" {
  filename      = data.archive_file.lambda.output_path
  function_name = var.name
  role          = aws_iam_role.lambda.arn
  handler       = var.handler

  source_code_hash = filebase64sha256(data.archive_file.lambda.output_path)

  runtime = "python3.7"

  environment {
    variables =  var.env_vars
  }
}