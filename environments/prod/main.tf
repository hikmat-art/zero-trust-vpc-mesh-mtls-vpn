terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source             = "../../modules/network"
  project_name       = var.project_name
  environment        = var.environment
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "pki" {
  source              = "../../modules/pki"
  project_name        = var.project_name
  environment         = var.environment
  root_ca_common_name = var.root_ca_common_name
  domain_name         = var.domain_name
  service_name        = var.service_name
}

module "nlb_mtls_service" {
  source             = "../../modules/nlb_mtls_service"
  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  target_port        = 8080
  server_cert_arn    = module.pki.service_cert_arn
  client_ca_cert_arn = module.pki.intermediate_ca_arn
}

module "client_vpn" {
  source             = "../../modules/client_vpn"
  project_name       = var.project_name
  environment        = var.environment
  vpn_cidr           = var.vpn_cidr
  server_cert_arn    = module.pki.service_cert_arn
  client_ca_cert_arn = module.pki.intermediate_ca_arn
  subnet_ids         = module.network.private_subnet_ids
  vpc_cidr           = var.vpc_cidr
}

module "dns" {
  source       = "../../modules/dns"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.network.vpc_id
  domain_name  = var.domain_name
  service_name = var.service_name
  nlb_dns_name = module.nlb_mtls_service.nlb_dns_name
  nlb_zone_id  = "Z32O12XQLNTSW2" # Example hosted zone ID for NLB
}

module "observability" {
  source             = "../../modules/observability"
  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  config_bucket_name = var.config_bucket_name
}

module "iam" {
  source       = "../../modules/iam"
  project_name = var.project_name
  environment  = var.environment
}
