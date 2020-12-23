module "vpc_mod" {
  source = "/var/lib/jenkins/workspace/test/modules/vpc"
}

module "keypair_mod" {
  source = "/var/lib/jenkins/workspace/test/modules/keypair"
}

data "template_file" "user_data" {
  template = file("/var/lib/jenkins/workspace/test/modules/ec2/data.sh")
}

resource "aws_instance" "web_server" {
  ami                         = var.ami
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [module.vpc_mod.sgid]
  subnet_id                   = module.vpc_mod.subnetid
  key_name                    = module.keypair_mod.keypairid
  associate_public_ip_address = true
  user_data = data.template_file.user_data.rendered

  tags = {

    Name = "Vijaypc-webserver"
    date = "23-12-2020"

  }

}

resource "aws_eip" "elasticip1" {
  instance = aws_instance.web_server.id
  vpc      = true
}


variable "ami" {
  default = "ami-0db0b3ab7df22e366"
}

output "instanceid" {
  value = aws_instance.web_server.id
}
