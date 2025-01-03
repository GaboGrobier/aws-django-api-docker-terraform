variable "lambda_role_name" {
  description = "The name of the IAM role for Lambda."
  type        = string
  default     = "lambda_exec_role"
}

variable "policy_name" {
  description = "The name of the policy for Lambda execution."
  type        = string
  default     = "lambda_sqs_sns_policy"
}

variable "sqs_queue_arn" {
  description = "The ARN of the SQS queue."
  type        = string
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic."
  type        = string
}
variable "region" {
  description = "Región AWS"
  type        = string
}

variable "account_id" {
  description = "ID de la cuenta AWS"
  type        = string
}