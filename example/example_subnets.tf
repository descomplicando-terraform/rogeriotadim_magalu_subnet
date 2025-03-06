module "vpc" {
  source = "git::https://github.com/descomplicando-terraform/rogeriotadim_magalu_vpc.git"
  name   = var.vpc_name
}

module "subnetpool" {
  source = "git::https://github.com/descomplicando-terraform/rogeriotadim_magalu_subnetpool.git"
  name   = var.subnetpool_name
  cidr   = var.subnetpool_cidr
}

locals {
  cidr_pool = module.subnetpool.subnetpool.cidr

  subnets = {
    for subnet in var.subnets_list : "${cidrsubnet(local.cidr_pool, subnet.newbits, subnet.netnum)}" => {
      name          = subnet.name
      description   = subnet.description
      vpc_id        = module.vpc.vpc.id
      subnetpool_id = module.subnetpool.subnetpool.id
    }
  }
}

module "subnets" {
  depends_on = [module.subnetpool, module.vpc]
  source     = "../"
  subnets    = local.subnets
}

output "subnets" {
  value = module.subnets.subnets
}