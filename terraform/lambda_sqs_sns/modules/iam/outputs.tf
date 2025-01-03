output "lambda_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "lambda_policy_arn" {
  description = "ARN de la política adjunta al rol Lambda"
  value       = aws_iam_policy.lambda_policy.arn
}


