terraform {
  backend "s3" {
    bucket = "bkt-tf-tfstate-gabogrobier-desafiolatam"
    key = "pruebafinal/desafiolatam/sqs/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "db-dynamo-tf-tfstate-gabogrobier-desafiolatam"
    encrypt = true
    
  }
}

module "provider" {
    source = "./modules/provider"
    region = local.region
  
}
module "sns" {
    source = "./modules/sns"
    topic_name = local.topic_name
    email_endpoint = local.email
  
}

module "lambda_function" {
    source = "./modules/lambda"
    lambda_filename = "${path.module}/lambda_sqs_sns/modules/lambda/function.zip"
    lambda_exec_role_arn = module.iam.lambda_role_arn
    lambda_name = local.lambda_name
    sns_topic_arn = module.sns.sns_topic_arn
  
}

module "sqs" {
    source = "./modules/sqs"
    sqs_name = local.sqs_name
  
}

module "lambda_sqs_trigger" {
    source = "./modules/lambda_sqs_trigger"
    sqs_queue_arn = module.sqs.sqs_queue_arn
    lambda_function_name = module.lambda_function.lambda_function_name
    batch_size = 10
    enabled = true
  
}
module "iam" {
    source = "./modules/iam"
    sns_topic_arn = module.sns.sns_topic_arn
    sqs_queue_arn = module.sqs.sqs_queue_arn
    lambda_role_name = local.lambda_role_name
    region = local.region
    account_id = local.account_id
    
  
}