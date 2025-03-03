
run "create_subnets" {
  command = apply

  assert {
    # condition     = module.subnets.subnet.name == var.name
    condition = alltrue([for subnet in module.subnets.subnets : subnet.id != ""])
    error_message = "invalid name"
  }

}
