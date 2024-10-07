resource "aws_vpc" "newstart" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = "true" 
    tags = {
    Name = "new start"
  }

}
