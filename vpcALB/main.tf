// main.tf

provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  azs                  = ["us-west-2a", "us-west-2b"]
  ami                  = "ami-0604d81f2fd264c7b"
  instance_type        = "t2.micro"
 security_group_ids    = aws_security_group.lb_sg.id
  tags = {
    Name = "my-vpc"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "nat_gateway_ids" {
  value = module.vpc.nat_gateway_ids
}

output "db_instance_id" {
  value = module.vpc.db_instance_id
}
module "alb" {
  source                = "./modules/alb"
  vpc_id                = module.vpc.vpc_id
  subnets               = module.vpc.public_subnet_ids
  alb_name              = "main-alb"
  target_group_name     = "main-tg"
  listener_port         = 80
				       }
