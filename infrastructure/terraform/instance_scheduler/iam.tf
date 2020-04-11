resource "aws_iam_role_policy" "stop_instance_control" {
  policy = data.aws_iam_policy_document.instance_control.json
  role = module.stop.role_id
}


resource "aws_iam_role_policy" "start_instance_control" {
  policy = data.aws_iam_policy_document.instance_control.json
  role = module.start.role_id
}

data aws_iam_policy_document "instance_control"{
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }

  statement {
    actions = [
      "ec2:Start*",
      "ec2:Stop*"
    ]

    resources = [
      "*"
    ]
  }
}