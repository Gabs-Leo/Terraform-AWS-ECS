/*
terraform {
  backend "s3" {
    bucket = "tfstate-gabs-teste"
    key    = "path/gabs-teste.tfstate"
    region = "us-east-1"
  }
}*/
provider "aws" {
  region = var.region != "" ? var.region : "us-east-1"
}

module "network" {
    source = "./modules/network"
    cluster_name = var.cluster_name
    region = var.region
}