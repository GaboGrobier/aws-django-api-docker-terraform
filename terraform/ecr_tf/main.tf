{
  backend "s3" {
    bucket = "Cambialo-por-tu-bucket-S3"
    key = "Cambialo-por-tu-ruta-de-guardado-tfstate"
    region = "us-east-1"
    dynamodb_table = "modifica-coloca-tu-tabla-dynamo"
    encrypt = true
    
  }
}
module "provider" {
    source = "./modules/provider"
    region = local.region
}

module "ecr" {
    source = "./modules/ecr_module"
  
}
