resource "aws_iam_role" "env0_deployer_role" {
  name = var.assume_role_name

  max_session_duration = 18000 # env0 requirement, 5 hours for SaaS

  # Change to your policy
  managed_policy_arns = var.managed_policy_arns

  # 913128560466 is env0's AWS Account ID
  # see: https://docs.env0.com/docs/connect-your-cloud-account#using-aws-assume-role
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::913128560467:root"
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : "${local.org_id}"
          }
        }
      }
    ]
  })

  tags = {
    note = "Created through env0 Bootstrap"
  }
}

resource "env0_aws_credentials" "credentials" {
  name = aws_iam_role.env0_deployer_role.arn #easier to track in the UI which role exactly is being used
  arn  = aws_iam_role.env0_deployer_role.arn
}