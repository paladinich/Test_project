<<<<<<< HEAD:Terraform/security_group.tf
// Main security group for the network
resource "aws_security_group" "ingress-ssh" {
=======
resource "aws_security_group" "ingress-ssh-http" {
>>>>>>> parent of 8a0da5c... last update:Terraform/Instance/security_group.tf
name = "allow-all-sg"
vpc_id = "aws_vpc.acc-proj.id"
// Access for SSH for my own VPN server
ingress {
    cidr_blocks = ["165.22.26.209/32"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

// Internet access rule for VM's
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
<<<<<<< HEAD:Terraform/security_group.tf
// Enable http access to servers
resource "aws_security_group_rule" "ingress-http"{

    type = "ingress"
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "80"
    to_port = "80"
    protocol = "tcp"

}
// Enable MySQL access in local subnet
resource "aws_security_group_rule" "ingress-sql"{
    type = "ingress"
    cidr_blocks = ["10.10.10.0/24"]
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"

}
=======
>>>>>>> parent of 8a0da5c... last update:Terraform/Instance/security_group.tf
