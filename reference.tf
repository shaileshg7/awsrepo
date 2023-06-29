resource "aws_instance" "myec2" {
  ami           = "ami-006dcf34c09e50022"
  instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}



/*
output "eip" {
    value = aws_eip.lb.public_ip
  
}

resource "aws_s3_bucket" "mys3" {
  bucket = "shaileshg7-test-bucket-001"
}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name
  
}
*/