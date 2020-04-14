module "start" {
  source = "./lambda"

  name = "start_instance"

  source_file = "${path.module}/code/start.py"
  output_path = "${path.module}/target/start.zip"

  handler = "start.lambda_handler"

  env_vars = {
    INSTANCE_ID = var.ec2_instance_id
  }

  schedule_expression = var.start_schedule_expression
}

module "stop" {
  source = "./lambda"

  name = "stop_instance"

  source_file = "${path.module}/code/stop.py"
  output_path = "${path.module}/target/stop.zip"

  handler = "stop.lambda_handler"

  env_vars = {
    INSTANCE_ID = var.ec2_instance_id
  }

  schedule_expression = var.stop_schedule_expression
}