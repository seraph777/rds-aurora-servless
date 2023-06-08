data "aws_vpc" "env" {
  count = length(data.aws_vpcs.prod.ids)
  id    = tolist(data.aws_vpcs.prod.ids)[count.index]
}

locals {
  security_groups = {
    rds = {
      name        = "rds_sg"
      description = "rds access"
      ingress = {
        mysql = {
          from        = 3306
          to          = 3306
          protocol    = "tcp"
          cidr_blocks = [data.aws_vpc.env[count.index].cidr_block]
        }
      }
    }
  }
}