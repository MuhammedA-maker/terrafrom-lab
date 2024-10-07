resource "aws_subnet" "public_module" {
  vpc_id                  = aws_vpc.newstart_module.id
  cidr_block              = var.public_subnet_cidr_module  
  map_public_ip_on_launch = true  

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private_module" {
  vpc_id     = aws_vpc.newstart_module.id
  cidr_block = var.private_subnet_cidr_module 

  tags = {
    Name = "PrivateSubnet"
  }
}
