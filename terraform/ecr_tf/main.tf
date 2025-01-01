/*comentar*/
terraform {
  backend "s3" {
    bucket = "bkt-tf-tfstate-gabogrobier-desafiolatam"
    key = "pruebafinal/desafiolatam/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "db-dynamo-tf-tfstate-gabogrobier-desafiolatam"
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
