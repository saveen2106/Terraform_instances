provider "aws" {
    region = "us-east-1"
}
resource "aws_instance" "web-app-ec2" {
    ami = "ami-bd32cac7"
    instance_type = "${var.instance_type}"
    tags = {name="web_app_helloWorld"}
}