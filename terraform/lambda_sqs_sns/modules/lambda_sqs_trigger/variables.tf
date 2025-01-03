variable "sqs_queue_arn" {
  description = "ARN de la cola SQS"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

variable "batch_size" {
  description = "Número máximo de mensajes que Lambda procesará por ejecución"
  type        = number
  default     = 10
}

variable "enabled" {
  description = "Habilita o deshabilita el mapeo de eventos"
  type        = bool
  default     = true
}
