# Proyecto EC2 con API en Django dentro de Docker utilizando Terraform, ECR, Lambda, SQS y SNS

Este proyecto tiene como objetivo la implementación y automatización de la creación de una instancia EC2 con una API en Django, contenida en Docker. Además, se utiliza Terraform para gestionar la infraestructura como código (IaC), incluyendo la creación de repositorios en Amazon ECR, una función Lambda que interactúa con SQS y SNS para el procesamiento de mensajes, y la configuración de pipelines para automatizar los despliegues.

## Descripción del Proyecto

### Infraestructura de AWS

1. **EC2 con Docker**: Se crea una instancia EC2 con una API en Django contenida dentro de un contenedor Docker.
2. **ECR (Elastic Container Registry)**: Repositorio de contenedores Docker para almacenar y distribuir imágenes.
3. **Lambda, SQS y SNS**: Se crea una función Lambda que interactúa con SQS (para el manejo de colas) y SNS (para la notificación de eventos).
4. **Terraform**: Se utiliza Terraform para crear y gestionar todos los recursos de AWS como EC2, ECR, Lambda, SQS y SNS.

### Arquitectura

1. **EC2**: Una instancia EC2 se configura y despliega con Docker y una API de Django.
2. **ECR**: Se configura un repositorio de ECR para almacenar y publicar imágenes Docker de la API.
3. **Lambda y SQS-SNS**: La función Lambda se conecta a una cola SQS y a un tópico SNS para procesar mensajes y enviar notificaciones.

## Estructura del Proyecto

El proyecto está dividido en varios módulos que se manejan mediante Terraform:

- **Módulos Terraform**: Cada módulo es responsable de la creación de un componente de infraestructura, como VPC, subredes, gateways, EC2, etc.
- **Pipeline de GitHub Actions**: Los pipelines automatizan el despliegue de la infraestructura y la construcción de contenedores Docker.

## Componentes del Proyecto

### Terraform

- **Backend S3**: Los archivos de estado de Terraform se almacenan en un bucket S3 para su gestión centralizada.
- **VPC, Subnet y Gateway**: Creación de una red privada y pública en AWS.
- **EC2**: Configuración de una instancia EC2 para ejecutar la API de Django.
- **ECR**: Construcción de un repositorio ECR para almacenar y publicar imágenes Docker.
- **Lambda, SQS y SNS**: Creación de una función Lambda que se activa con mensajes en SQS y envía notificaciones a través de SNS.

### GitHub Actions Pipelines

1. **Pipeline de Construcción de EC2 con API**: Despliega y configura la instancia EC2 y ejecuta la API de Django dentro de Docker.
2. **Pipeline de Construcción de ECR y Publicación de Imágenes**: Construye y sube las imágenes Docker de la API a ECR.
3. **Pipeline de Construcción de Lambda, SQS y SNS**: Despliega la función Lambda, crea la cola SQS y el tópico SNS para manejar eventos.
4. **Escaneo de Seguridad del Repositorio**: Escanea el código de Terraform en busca de vulnerabilidades utilizando Snyk.

## Instalación y Configuración

### Requisitos Previos

- Terraform 1.10.3
- Docker
- AWS CLI configurado con acceso a tus credenciales de AWS.
- GitHub Secrets configurados en el repositorio con las siguientes variables:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `AWS_REGION`
  - `USER_SERVER` (usuario para acceder al servidor EC2)
  - `AWS_SSH_PRIVATE_KEY` (clave SSH privada para acceder a la instancia EC2)

### Instrucciones

1. **Clona el Repositorio**:
   ```bash
   git clone <url-del-repositorio>
   cd <nombre-del-repositorio>
   2 **Inicializa terraform**:
   ```

```bash
cd terraform
terraform init
terraform apply -auto-approve
```

## Despliegue

### Desplegar EC2 con la API
Después de aplicar Terraform, se ejecutará automáticamente el pipeline de GitHub Actions que:

- Desplegará la instancia EC2.
- Desplegará la API de Django dentro de un contenedor Docker.

### Construcción de ECR y Docker
El pipeline de GitHub Actions construirá y subirá las imágenes Docker a ECR.

### Desplegar Lambda, SQS y SNS
El pipeline también se encargará de crear la función Lambda, SQS y SNS para el procesamiento de mensajes.

## Pipeline de GitHub Actions
Este proyecto utiliza varios pipelines de GitHub Actions para automatizar el proceso de despliegue:

1. **Escaneo de Infraestructura como Código (IaC)**: Este pipeline escanea el código Terraform para detectar vulnerabilidades de seguridad.
2. **Construcción de ECR y Publicación de Imágenes**: Construye las imágenes Docker y las sube al repositorio ECR.
3. **Construcción de EC2 con la API**: Despliega la infraestructura EC2 y la API dentro de Docker.
4. **Construcción de Lambda, SQS y SNS**: Despliega los recursos de Lambda, SQS y SNS.

## Conclusión
Este proyecto facilita la automatización del despliegue de una API Django contenida en Docker en una instancia EC2 de AWS, junto con la creación de recursos como ECR, Lambda, SQS y SNS, todo ello gestionado mediante Terraform y GitHub Actions. Esto permite una infraestructura escalable y segura que se puede administrar fácilmente a través de la infraestructura como código.



```
