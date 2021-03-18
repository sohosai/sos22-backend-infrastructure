terraform {
  required_version = "0.14.8"

  required_providers {
    external = {
      version = "2.0.0"
      source  = "hashicorp/external"
    }
    sakuracloud = {
      version = "2.7.1"
      source  = "sacloud/sakuracloud"
    }
  }
}

