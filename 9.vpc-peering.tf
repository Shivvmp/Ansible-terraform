data "aws_vpc" "devsecops-vpc-vpc" {
  id = "vpc-0f697d34684b84ca7"
}

# VPC Peering with existing VPC
resource "aws_vpc_peering_connection" "ansible-vpc-peering" {
  peer_vpc_id = data.aws_vpc.devsecops-vpc-vpc.id
  vpc_id      = aws_vpc.default.id
  auto_accept = true

  tags = {
    Name = "Ansible-${var.vpc_name}-Peering"
  }
}

# Route from our VPC to peer VPC
resource "aws_route" "peering-to-ansible-vpc" {
  route_table_id            = aws_route_table.terraform-public.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.ansible-vpc-peering.id
}