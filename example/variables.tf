variable "vpc_name" {
  description = "Nome do VPC"
  type        = string
}

variable "subnetpool_name" {
  description = "Nome do SubnetPool"
  type        = string
}

variable "subnetpool_cidr" {
  description = "CIDR block do SubnetPool"
  type        = string
}

variable "subnets_list" {
  description = "Lista das Subnets"
  type = list(object({
    name        = string
    description = optional(string)
    newbits     = number
    netnum      = number
    }
  ))
  default = [
    {
      name        = "subnet-test-4091"
      description = "subnet 4091 created by Terraform in order to test"
      newbits     = 12
      netnum      = 4091
    },
    {
      name        = "subnet-test-4092"
      description = "subnet 4092 created by Terraform in order to test"
      newbits     = 12
      netnum      = 4092
    },
    {
      name        = "subnet-test-4093"
      description = "subnet 4093 created by Terraform in order to test"
      newbits     = 12
      netnum      = 4093
    }
  ]

}

variable "api_key" {
  description = "API Key"
  type        = string
  sensitive   = true
}

variable "key_id" {
  description = "Key ID"
  type        = string
  sensitive   = true
}

variable "key_secret" {
  description = "Key Secret"
  type        = string
  sensitive   = true
}

# variable "subnets" {
#   type = map(object({
#     name          = string
#     description   = optional(string)
#     subnetpool_id = string
#     vpc_id        = string
#     }
#   ))
# }