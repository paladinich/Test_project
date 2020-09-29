// list of user data files that uses cloudinit after machines installation
data "template_file" "user_data" {
  template = file("add-ansible.yaml")
  }
data "template_file" "user_data_web" {
  template = file("add-web-app.yaml")
  }
data "template_file" "user_data_sql" {
  template = file("add-mysql.yaml")
  }


// Ansible server which provisions app and configures db
resource "aws_instance" "Ansible" {
  ami = "ami-0f920d75f0ce2c4bb"
  instance_type = "t3.micro"
  user_data = data.template_file.user_data.rendered
  vpc_security_group_ids = ["aws_vpc.acc-proj.id"]
  private_dns = "ansible-server"
  monitoring = true
  private_ip = "10.10.10.7/24"
  tags = {
    Project = "Acc-Project"
    Name = "Ansible"
    Module = "Automation"
      }
  }

// Web server where python app is installed
resource "aws_instance" "web-server-py" {
    ami = "ami-0f920d75f0ce2c4bb"
    instance_type = "t3.micro"
    user_data = data.template_file.user_data_web.rendered
    vpc_security_group_ids = ["aws_vpc.acc-proj.id"]
    private_dns = "web-server"
    monitoring = true
    private_ip = "10.10.10.6/24"
    tags = {
      Project = "Acc-Project"
      Name = "Web-server-py"
      Module = "web"
        }
  }

// SQL server where mysql server is installed, db would named acc-proj, access through standard port
    resource "aws_instance" "DBServer" {
      ami = "ami-0f920d75f0ce2c4bb"
      instance_type = "t3.micro"
      user_data = data.template_file.user_data_sql.rendered
      vpc_security_group_ids = ["aws_vpc.acc-proj.id"]
      private_dns = "db-server"
      monitoring = true
      tags = {
        Project = "Acc-Project"
        Name = "DBServer"
        Module = "DB"
          }
    }
