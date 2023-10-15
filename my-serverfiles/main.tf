resource "aws_instance" "test-server" {
  ami = "ami-0261755bbcb8c4a84"
  instance_type = "t2.micro"
  key_name = "Awskeypair"
  vpc_security_group_ids = ["sg-060e7fc727f56bbab"]
  connection {
     type           = "ssh"
     user           = "ubuntu"
     private_key    = file("./Awskeypair.pem")
     host           = self.public_ip
}

provisioner "remote-exec" {
    inline = ["echo 'wait to start the instance' "]
}
tags = {
  Name = "test-server"
}
provisioner "local-exec" {
    inline = ["echo ${aws_instance.test-server.public_ip} > inventory "
}
provisioner "local-exec" {
    command = "ansible-playbook /var/lib/jenkins/workspace/Banking-project/my-serverfiles/finance-playbook.yml
}
}