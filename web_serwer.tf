#My terraform,Buikding WebSerwer with bootstrap
provider "aws" {
  region = "eu-central-1"
}
resource "aws_instance" "my_server" {
  ami           = "ami-0b8fd93c15b2c81ce" #ami amazon instance
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.my_WEBserver.id ]
  user_data = <<EOF
  EOF

}
resource "aws_security_group" "my_WEBserver" {
  name = "webserver_securiti_group"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-l"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
