variable "topic_name" {
  description = "The name of the SNS topic."
  type        = string
}

variable "email_endpoint" {
  description = "The email endpoint for the SNS subscription."
  type        = string
}
