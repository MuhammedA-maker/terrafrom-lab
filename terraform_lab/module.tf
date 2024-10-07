module "test" {
    source = "./devtest"
    vpc_cidr_module = var.vpc_cidr
    public_subnet_cidr_module=var.public_subnet_cidr
    private_subnet_cidr_module=var.private_subnet_cidr
    region_module=var.region   
}
