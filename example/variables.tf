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