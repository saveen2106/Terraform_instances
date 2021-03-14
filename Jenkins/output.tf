output "instance_type" { value = "${aws_instance.jenkins-ec2.instance_type}" }
output "ami" { value = "${aws_instance.jenkins-ec2.ami}"}