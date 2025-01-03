resource "aws_sns_topic" "sns_topic" {
  name = var.topic_name
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = var.email_endpoint
}

