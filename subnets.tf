resource "mgc_network_vpcs_subnets" "subnets" {
  for_each      = var.subnets
  name          = each.value.name
  description   = each.value.description
  cidr_block    = each.key
  ip_version    = "IPv4"
  subnetpool_id = each.value.subnetpool_id
  vpc_id        = each.value.vpc_id
}

output "subnets" {
  value = [for subnet in mgc_network_vpcs_subnets.subnets : subnet]
}
