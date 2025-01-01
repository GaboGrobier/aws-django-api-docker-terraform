resource "aws_ecr_repository" "ecr_web" {
    name = var.ecr_name
    image_tag_mutability = "MUTABLE"
    
  
}