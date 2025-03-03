variable "subnets" {
  type = map(object({
    name          = string
    description   = optional(string)
    subnetpool_id = string
    vpc_id        = string
    }
  ))
}
