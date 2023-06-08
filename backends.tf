# --- root/backends.tf ---

terraform {
  backend "remote" {
    organization = "cyberia"

    workspaces {
      name = "rds-aurora-servless"
    }
  }
}