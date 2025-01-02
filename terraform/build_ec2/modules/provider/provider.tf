/* 
para le provider se dicidio construirlo en modulo con el fin de mantener la estructura del proyecto y ademas permite la modularidad de cambiar de region si es necesario

*/


provider "aws" {
    region = var.region
  
}