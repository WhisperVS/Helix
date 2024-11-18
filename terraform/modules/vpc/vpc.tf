##################### VPC ################################
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}
##################### subnets #############################
resource "aws_subnet" "subnet" {
  for_each          = var.subnets
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]

  tags = merge(var.subnet_tags, { "Name" = each.key })
}
###################### route table #########################
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.my_gw.id
  }

  tags = var.rt_tags
}
################### route table subnet association ######################
resource "aws_route_table_association" "my_rt_association" {
  for_each       = toset(var.subnets_to_associate)
  subnet_id      = aws_subnet.subnet[each.value].id
  route_table_id = aws_route_table.my_rt.id
}
###################### internet gateway ###################
resource "aws_internet_gateway" "my_gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = var.ig_gw_tags
}
