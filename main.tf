resource "aws_vpc" "TATA-vpc" {
 cidr_block = "10.50.0.0/16"
 instance_tenancy = "default"
 enable_dns_hostnames = true
tags = {
 Name = "tata-vpc"
}
}
resource "aws_subnet" "tata-subnet" {
 vpc_id = "${aws_vpc.TATA-vpc.id}"
 cidr_block = "10.50.1.0/24"
tags = {
 Name = "tata-subnet"
}
}
resource "aws_internet_gateway" "igw-tata" {
 vpc_id = "${aws_vpc.TATA-vpc.id}"
tags = {
 Name = "igw-for-tata-server"
}
}
resource "aws_route_table" "route-tata-server" {
 vpc_id = "${aws_vpc.TATA-vpc.id}"
 route{
  cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw-tata.id}"
}
tags = {
 Name = "tata-server-RT"
}
}
resource "aws_route_table_association" "route-tata-server" {
 subnet_id = "${aws_subnet.tata-subnet.id}"
 route_table_id = "${aws_route_table.route-tata-server.id}"
}
resource "aws_security_group" "tata-sg" {
  name = "security-group-tata"
  description = "allow incoming http and ssh connection"
  vpc_id = "${aws_vpc.TATA-vpc.id}"
 ingress {
  from_port = "0"
  to_port = "65535"
  cidr_blocks = ["0.0.0.0/0"]
  protocol = "tcp"
}
 tags = {
  Name = "webserver-sec-grp"
} 
}
resource "aws_instance" "main" {
 ami = "ami-0c55b159cbfafe1f0"
 instance_type = "t2.micro"
 subnet_id = "${aws_subnet.tata-subnet.id}"
 vpc_security_group_ids = ["${aws_security_group.tata-sg.id}"]
 associate_public_ip_address = true
 key_name = "quest"
 tags = {
 Name = "webserver"
 }
}
