resource "aws_default_vpc" "default"{
}

resource "aws_security_group" "infra-app-sg" {
  name = "${var.env}-infra-app-sg"
  description = "tf auto generated infra"
  vpc_id = aws_default_vpc.default.id

  
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
}

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
}

  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open"
}

  tags = {
    name = "${var.env}-app-sg"
}
}

resource "aws_instance" "multienv-instance" {
  count = var.instance_count
  depends_on = [aws_default_vpc.default,aws_security_group.infra-app-sg]
  key_name = "formradul"
  instance_type = var.instance_type
  ami = var.ami_id

  root_block_device {
    volume_size = var.env == "prd" ? 20 : 10
    volume_type = "gp3"
}

  tags = {
      Name = "{var.env}-infra-app-ec2"
      Environment = var.env
  }

}
