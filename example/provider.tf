terraform {
  required_providers {
    mgc = {
      source = "magalucloud/mgc"
    }
  }
}

provider "mgc" {
  api_key = var.api_key
  region  = "br-se1"
  object_storage = {
    key_pair = {
      key_id     = var.key_id
      key_secret = var.key_secret
    }
  }
}