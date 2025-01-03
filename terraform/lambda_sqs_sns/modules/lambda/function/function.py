import json
import boto3
import os


# Crear cliente SNS
sns = boto3.client('sns')

# ARN del tema SNS (se inyectará como variable de entorno)
SNS_TOPIC_ARN = os.environ['SNS_TOPIC_ARN']

def lambda_handler(event, context):
    # Iterar sobre los registros recibidos del evento SQS
    for record in event['Records']:
        # Leer el cuerpo del mensaje
        message = json.loads(record['body'])
        print(f"Mensaje recibido: {message}")
        
        # Crear contenido de la notificación
        notification = (
            f"Evento: {message['event']}\n"
            f"ID: {message['id']}\n"
            f"Timestamp: {message['timestamp']}\n"
        )
        
        # Enviar notificación al tema SNS
        response = sns.publish(
            TopicArn=SNS_TOPIC_ARN,
            Message=notification,
            Subject="Notificación de Nuevo Evento"
        )
        print(f"Notificación enviada: {response['MessageId']}")
    
    return {"statusCode": 200, "body": "Mensajes procesados"}
