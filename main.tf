module "vpc" {
  source     = "./modules/vpc"
  vpc_name   = var.vpc_name
  cidr_block = var.cidr_block
}

module "security_groups" {
  source        = "./modules/security_groups"
  vpc_id        = module.vpc.vpc_id
  local_user_ip = var.local_user_ip
}

module "alb" {
  source             = "./modules/alb"
  alb_name           = var.alb_name
  security_group_ids = [module.security_groups.alb_sg_id]
  subnet_ids         = module.vpc.public_subnets
  vpc_id             = module.vpc.vpc_id
}

module "rds" {
  source                = "./modules/rds"
  db_instance_name      = var.db_instance_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_name               = var.db_name
  vpc_security_group_id = module.security_groups.rds_sg_id
  subnet_ids            = module.vpc.private_subnets
}

module "ecs" {
  source             = "./modules/ecs"
  task_family        = var.ecs_task_family
  container_name     = var.ecs_container_name
  container_image    = var.ecs_container_image
  cpu                = 256
  memory             = 512
  service_name       = var.ecs_service_name
  subnet_ids         = module.vpc.private_subnets
  security_group_ids = [module.security_groups.ecs_sg_id]
  target_group_arn   = module.alb.target_group_arn
  desired_count      = 2
  db_endpoint        = module.rds.endpoint
  db_username        = var.db_username
  db_password        = var.db_password
  db_name            = var.db_name
  log_group_name     = "/ecs/wordpress"
  alb_dns_name       = module.alb.dns_name
}
