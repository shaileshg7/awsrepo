resource "aws_instance" "myec2instance" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.types["ap-south-1"]

  tags = {
    Name = "web-app"
  }
}

