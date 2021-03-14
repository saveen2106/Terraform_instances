provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "jenkins" {
  name = "jenkins"
  description = "Web Security Group"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port = 8080
    to_port = 8090
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins-ec2" {
    ami = "ami-038f1ca1bd58a5790"
    key_name = "jenkins"
    security_groups = ["${aws_security_group.jenkins.name}"]
    instance_type = "${var.instance_type}"
    tags = {name="jenkins_ec2"}
}