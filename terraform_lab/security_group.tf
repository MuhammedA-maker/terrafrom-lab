# Security Group for Public Instances
resource "aws_security_group" "public_instance_sg" {
  name        = "public_instance_sg"
  description = "Allow HTTP and HTTPS inbound traffic and all outbound traffic"
  vpc_id      = module.test.vpc_out

  tags = {
    Name = "PublicInstanceSG"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for Private Instances
resource "aws_security_group" "private_instance_sg" {
  name        = "private_instance_sg"
  description = "Allow inbound traffic from the public security group and all outbound traffic"
  vpc_id      = module.test.vpc_out

  tags = {
    Name = "PrivateInstanceSG"
  }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  
    }
 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  
    cidr_blocks = ["0.0.0.0/0"]
  }
}
