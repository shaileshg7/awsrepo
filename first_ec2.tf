resource "aws_instance" "myec2" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  user_data = file("${path.module}/install.sh")
  tags = {
    "Name" = "PostgreSQL DB"
  }
}

# ami-02396cdd13e9a1257