# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    tomap({
      Name = "vpc-${var.region_tag[var.aws_region]}-${var.environment_tag[var.environment]}"
  }), var.resource_tags)

}
######PUBLIC #############
resource "aws_subnet" "subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.subnet_id_public)
  cidr_block        = var.subnet_id_public[count.index]
  availability_zone = var.availability_zone[count.index]

  tags = merge(tomap({
    Name = "public-${var.environment}-${count.index + 1}"
  }), var.resource_tags)

}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = merge(tomap({
    Name = "public-routetable-${var.environment}"
  }), var.resource_tags)

}
resource "aws_route_table_association" "a" {
  count          = length(var.subnet_id_public)
  subnet_id      = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.public.id

}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(tomap({
    Name = "IGW-${var.environment}"
  }), var.resource_tags)
}

######PRIVATE #############
# resource "aws_subnet" "subnet-private" {
#   vpc_id            = aws_vpc.vpc.id
#   count             = length(var.subnet_id_private)
#   cidr_block        = var.subnet_id_private[count.index]
#   availability_zone = var.availability_zone[count.index]
#   tags = merge(tomap({
#     Name = "private-${var.environment}-${count.index + 1}"
#   }), var.resource_tags)
# }


# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.NAT.id
#   }
#   tags = merge(tomap({
#     Name = "privateroutable--${var.environment}"
#   }), var.resource_tags)

# }
# resource "aws_eip" "IP" {
#   domain = "vpc"
# }
# resource "aws_nat_gateway" "NAT" {
#   allocation_id = aws_eip.IP.id
#   subnet_id     = element(aws_subnet.subnet[*].id, 0)

#   tags = merge(tomap({
#     Name = "NAT-${var.environment}"
#   }), var.resource_tags)
# }

# resource "aws_route_table_association" "b" {
#   count          = length(var.subnet_id_private)
#   subnet_id      = aws_subnet.subnet-private[count.index].id
#   route_table_id = aws_route_table.private.id
# }


