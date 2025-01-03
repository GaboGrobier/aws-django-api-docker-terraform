resource "aws_lambda_function" "example_lambda" {
  function_name = var.lambda_name
  runtime       = "python3.12"
  role          = var.lambda_exec_role_arn
  handler       = "function.lambda_handler"
  
  # Asume que el archivo zip de Lambda está disponible en el sistema local
  filename         = "${path.module}/function.zip"
  source_code_hash = filebase64sha256("${path.module}/function.zip")

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }
}
