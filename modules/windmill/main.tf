terraform {
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = "2.0.0-beta.1"
    }
  }
}

provider "nomad" {
  address = var.nomad_address
}
