resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.requester_vpc_id       # Jenkins VPC
  peer_vpc_id   = var.accepter_vpc_id        # EKS VPC
  auto_accept   = true

  tags = {
    Name = "jenkins-to-eks-peering"
  }
}

# Route from Jenkins → EKS
resource "aws_route" "requester_to_accepter" {
  route_table_id            = var.requester_route_table_id
  destination_cidr_block    = var.accepter_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# Route from EKS → Jenkins
resource "aws_route" "accepter_to_requester" {
  route_table_id            = var.accepter_route_table_id
  destination_cidr_block    = var.requester_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}
