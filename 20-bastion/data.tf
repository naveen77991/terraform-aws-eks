data "aws_ami" "joindevops" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/roboshop/dev/bastion_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/roboshop/dev/public_subnet_ids"
}
