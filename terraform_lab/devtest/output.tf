output "vpc_out" {
    value = aws_vpc.newstart_module.id
}
output "subnet_output_pub"{
    value = aws_subnet.public_module.id
}

output "subnet_output_priv"{
    value = aws_subnet.private_module.id
}

