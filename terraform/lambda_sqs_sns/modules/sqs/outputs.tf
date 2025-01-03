output "sqs_queue_url" {
  value = aws_sqs_queue.mainly_sqs.url
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.mainly_sqs.arn
}
