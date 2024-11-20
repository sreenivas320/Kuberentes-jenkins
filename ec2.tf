###Deploying Docker-swarm instances, keys and IP outputs############### 
resource "aws_instance" "kubeadm_master" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id      = aws_subnet.SWARM-VPC-Pub-subnet.id
  vpc_security_group_ids = [aws_security_group.SWARM-VPC-SG.id] 
  associate_public_ip_address = true
  availability_zone = var.az_zone
  key_name = "key001"
  user_data = file("common.sh")
 
provisioner "file" {
    source      = "master.sh"
    destination = "/tmp/master.sh"
  }
connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("key001.pem")
      host        = self.public_ip
      timeout     ="5m"
          }

 provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/master.sh",
      "/tmp/master.sh", # Execute your script
    ]
  }

  tags = {
    Name = "kubeadm_master"
    Owner = "Mubeen"
    customer = "Mobin"
  }
  
}

resource "aws_instance" "kubeadm_node1" {
  ami = var.ami_id
  count = 2
  instance_type = var.instance_type
  subnet_id      = aws_subnet.SWARM-VPC-Pub-subnet.id
  vpc_security_group_ids = [aws_security_group.SWARM-VPC-SG.id]
  associate_public_ip_address = true
  availability_zone = var.az_zone
  key_name = "key001"
  user_data = file("common.sh")

  #tags = {
   # Name = "kubeadm_node1"
    #Owner = "Latheef"
    #customer = "Latheef"
  #}
tags = {
    "Name"  = "Node${count.index + 1}"
    "Value" = "Value${count.index + 1}"
  }


  
}


#resource "aws_instance" "kubeadm_node2" {
 # ami = var.ami_id
  #instance_type = var.instance_type
  #subnet_id      = aws_subnet.SWARM-VPC-Pub-subnet.id
  #vpc_security_group_ids = [aws_security_group.SWARM-VPC-SG.id]
  #associate_public_ip_address = true
  #availability_zone = var.az_zone
  #key_name = "kubeadm-key"
  #user_data = file("docker-swarm.sh")

  #tags = {
   # Name = "kubeadm_node2"
    #Owner = "Latheef"
    #customer = "Latheef"
  #}
  
#}



### Outputs of Docker swarm and docker-nodes public Ips
output "kubeadm_master" {
  value = "${aws_instance.kubeadm_master.*.public_ip}"
}

output "kubeadm_node1" {
  value = "${aws_instance.kubeadm_node1.*.public_ip}"
}

# output "kubeadm_token" {
#   value = "${aws_instance.kubeadm_master.provisioner*.*remote-exec}"
# }

#output "swarm_node2" {
 # value = "${aws_instance.kubeadm_node2.*.public_ip}"
#}

