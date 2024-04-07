terraform {
  required_providers {
   openstack = {
    source = "terraform-provider-openstack/openstack"
  }
 }
}

provider "openstack" {
        cloud = "openstack" 
}


resource "openstack_compute_instance_v2" "worker_instance" {
  count = 2  # Number of worker nodes
  name = "kube-worker-${count.index}"
  image_name = "ubuntu-22.04-LTS"
  flavor_name = "C2R4_10G"
  key_pair = "masterKey"
  security_groups = ["default"]

  network {
    name = "acit"
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
    host = self.access_ip_v4
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "sudo apt update",
      // No need to install all tools, just ensure it's reachable and meets prerequisites
    ]
  }
}
