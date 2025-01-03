output "event_source_mapping_id" {
  description = "ID del mapeo de eventos entre SQS y Lambda"
  value       = aws_lambda_event_source_mapping.sqs_trigger.id
}
