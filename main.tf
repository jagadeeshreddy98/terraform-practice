resource "aws_vpc" "myvpc" {
  tags = {
    Name = "terrafromvpc"
    Env  = "dev"
  }

  cidr_block          = "10.0.0.0/16"
  instance_tenancy    = "default"
  enable_dns_hostnames = "true"
}

resource "aws_subnet" "mysubnet" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "terraformsubnet"
  }
  availability_zone       = "us-east-1a"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "terraformigw"
  }
}
resource "aws_route_table" "art" {
  tags = {
    Name = "terraformroutetable"
  }
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "subnet_association" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.art.id
}
