variable "lambda_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "lambda_exec_role_arn" {
  description = "The ARN of the IAM role Lambda will assume."
  type        = string
}

variable "lambda_filename" {
  description = "The filename of the Lambda zip file."
  type        = string
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic."
  type        = string
}
