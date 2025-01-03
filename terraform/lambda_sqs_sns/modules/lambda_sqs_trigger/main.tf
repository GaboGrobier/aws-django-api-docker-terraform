# Asociar la cola SQS con la función Lambda
resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn  = var.sqs_queue_arn
  function_name     = var.lambda_function_name
  batch_size        = var.batch_size
  enabled           = var.enabled
}

# Agregar permisos para que SQS invoque la función Lambda
resource "aws_lambda_permission" "allow_sqs_invoke" {
  statement_id  = "AllowSQSToInvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "sqs.amazonaws.com"
  source_arn    = var.sqs_queue_arn
}
