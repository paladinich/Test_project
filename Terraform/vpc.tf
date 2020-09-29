// main VPC which would be used to build an app
resource "aws_vpc" "acc-proj" {
  cidr_block = "10.10.10.0/24"
  id = acc-proj_1
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Project = "Acc-Project"
    Name = "Main-nw"
  }
}
