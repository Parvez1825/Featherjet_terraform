vpc_cidr = "10.0.0.0/16"

subnet_id_public = ["10.0.1.0/25"]

availability_zone = ["us-east-1a"]

# subnet_id_private = ["10.0.1.0/25"]

aws_region = "us-east-1"

environment = "dev"

resource_tags = {
  application = "Featherjet"
  env = "dev"

}

peer_vpc_id        = "vpc-6ea66117"   
peer_route_table_id = "rtb-2deb5255"