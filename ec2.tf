resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.types["ap-south-1"]

  tags = {
    Name = "web-app"
  }
}

