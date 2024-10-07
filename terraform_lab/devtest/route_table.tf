resource "aws_internet_gateway" "test_route" {
    vpc_id = aws_vpc.newstart_module.id
    tags = {
        Name = "IGW"
    }
}

resource "aws_route_table" "public_route_table" {  
    vpc_id = aws_vpc.newstart_module.id 

    tags = {
        Name = "route-public"
    }
}

resource "aws_route" "public_internet_gateway" {
    route_table_id         = aws_route_table.public_route_table.id  
    destination_cidr_block = "0.0.0.0/0"  
    gateway_id             = aws_internet_gateway.test_route.id  
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_module.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.newstart_module.id

  tags = {
    Name = "route-private"
  }
}


resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_module.id
  route_table_id = aws_route_table.private.id
}

