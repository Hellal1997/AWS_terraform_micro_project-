#create public route table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id

}

#merge route table to igw 

resource "aws_route" "pub_route" {
  route_table_id            = aws_route_table.public.id #refernce route table in the top 
  destination_cidr_block    = "0.0.0.0/0" #all 
  gateway_id = aws_internet_gateway.mygateway.id
}

#attatch route table assosiation subnet id private and public all 4  + route table id 

resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.public.id
}

#create private route table 

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.myvpc.id

}

#delete gatway_id because it private = it can connect to nat gateway change to last line to nat 
resource "aws_route" "pri_route" {
  route_table_id            = aws_route_table.public.id #refernce route table in the top 
  destination_cidr_block    = "0.0.0.0/0" #all 
  gateway_id = aws_nat_gateway.mynat.id
}
#assosiation 
resource "aws_route_table_association" "private1" {
    subnet_id = aws_subnet.private1.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
    subnet_id = aws_subnet.private2.id
    route_table_id = aws_route_table.private.id
}

