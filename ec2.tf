# data "aws_ami" "redhat2" {
#   owners      = ["self"]
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["Amazon Linux 2 AMI (HVM)"]
#   }

#   filter {
#     name   = "architecture"
#     values = ["x86_64"]
#   }

# #}

# data "aws_ami" "ubuntu1" {
#   owners      		 = ["679593333241"]
#   most_recent 		 = true

#   filter {
#     name   		 = "name"
#     values 		 = ["CentOS Linux 7 x86_64 HVM EBS *"]
#   }
#   filter {
#     name   		 = "architecture"
#     values 		 = ["x86_64"]
#   }
#   filter {
#     name   		 = "root-device-type"
#     values 		 = ["ebs"]
#   }
# }


resource "aws_instance" "frontend_instance" {
  # count         = 1
  depends_on    = [aws_vpc.dev-vpc]
  ami           =  "ami-0b89f7b3f054b957e"
  instance_type = var.instance-type
  #vpc_id        = aws_vpc.dev-vpc.id
  subnet_id     = aws_subnet.dev-public[0].id
  #subnet_id      = element(aws_subnet.dev-public, count.index)
  #vpc_security_group_ids = "vpc-0859fa737a167cb13"
  tags = {
    Name        = "dev1"
  }
}

