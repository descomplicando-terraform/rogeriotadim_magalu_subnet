data "mgc_network_vpc" "vpc" {
  id = "971c798c-c788-4166-b051-2f3f850c7858"
}

data "mgc_network_subnetpool" "subnetpool" {
  id = "50ba0f14-9b43-4ef9-ac42-da78cdd0afd0"
}

locals {
  cidr_pool = data.mgc_network_subnetpool.subnetpool.cidr
  subnets = {
    cidrsubnet(local.cidr_pool, 12, 4091) = {
      name          = "subnet-test-4091"
      description   = "subnet 4091 created by Terraform in order to test"
      vpc_id        = data.mgc_network_vpc.vpc.id
      subnetpool_id = data.mgc_network_subnetpool.subnetpool.id
    }
    cidrsubnet(local.cidr_pool, 12, 4092) = {
      name          = "subnet-test-4092"
      description   = "subnet 4092 created by Terraform in order to test"
      vpc_id        = data.mgc_network_vpc.vpc.id
      subnetpool_id = data.mgc_network_subnetpool.subnetpool.id
    }
    cidrsubnet(local.cidr_pool, 12, 4093) = {
      name          = "subnet-test-4093"
      description   = "subnet 4093 created by Terraform in order to test"
      vpc_id        = data.mgc_network_vpc.vpc.id
      subnetpool_id = data.mgc_network_subnetpool.subnetpool.id
    }
  }
}

module "subnets" {
  source  = "../"
  subnets = local.subnets
}

output "subnets" {
  value = module.subnets.subnets
}