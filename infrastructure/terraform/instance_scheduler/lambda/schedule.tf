resource "aws_cloudwatch_event_rule" "rule" {
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "stop_instance" {
  arn       = aws_lambda_function.lambda.arn
  rule      = aws_cloudwatch_event_rule.rule.name
}

resource "aws_lambda_permission" "stop_instance_allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.rule.arn
}
