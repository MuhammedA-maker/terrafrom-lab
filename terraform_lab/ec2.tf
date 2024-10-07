resource "aws_instance" "public" {
    ami                    = var.ami
    subnet_id             = module.test.subnet_output_pub
    instance_type         = var.ec2_instance_type
    vpc_security_group_ids = [aws_security_group.public_instance_sg.id]
    associate_public_ip_address = true

    tags = {
        Name = "ec2-pub"
    }
}

resource "aws_instance" "private" {
    ami                    = var.ami
    subnet_id             = module.test.subnet_output_priv
    instance_type         = var.ec2_instance_type
    vpc_security_group_ids = [aws_security_group.private_instance_sg.id]

    tags = {
        Name = "ec2-private"
    }
}
