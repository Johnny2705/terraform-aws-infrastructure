resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCk1pdhLPLb7uNFrMGkBb5vQnEi5ig6elhAR+LWqs+WOKx4cF5Xrrs6TE1cBTJNdlQbp7NMeH+iKLpe+4I1ZzOCQIuVmIV3bnMB7MvNUw9VrpgqAUE0kgWTiJtx6IFLtlysaYsHVO7AvzlIGu9is2Gwcbvyznn+GQEs12pIymkfVpJYe+J6jjuIZALmwVXe1kpml8URnXAY81N+PX84e250wKadddoeUZS82xGXYx9GEHAYH2O6RfBm9IZz42309rnGu79GsxpDp1zJS7r0pDVJlff+7H5WINTB0WX+nLE0p/f+E1DMXgPXUIsuWYlVMY5cuXq9dN8rquLd74P8R0Vs4XquwCYsi4XKInyzxGl7PnSPaR18NulB84nSnOkiyU9DklLTodG2k84BK/+qqEvpBl1+Q0odtHgTex1MaYEKpFePOxRHFQn3RIAwUVIO8DJ5Q6Y8QLVUoSqzcAt1c6YCqMmFfrv3Ab8h4Z3e+EOwR5NlNGu3mhgkH4foLLd3XhE= INTEL@DESKTOP-B4EU5S5"
}

resource "aws_instance" "ec2" {
  ami                         = "ami-004e960cde33f9146"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.main.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = aws_key_pair.deployer_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "learning_ec2_instance"
  }
}
