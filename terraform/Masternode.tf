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

resource "openstack_compute_instance_v2" "master_instance" {
        name = "kubemaster"
        image_name = "ubuntu-22.04-LTS"
        flavor_name = "C2R4_10G"  ##må muligens endres på
        key_pair = "Bira_mac_key"
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
        
        #all files from my directory is going to the cloud
        provisioner "file" { 
        ##send_playbook##
         source      = "/Users/biraveennedunchelian/Desktop/info ops/project1/Playbooks/users.yml"
         destination = "/home/ubuntu/setup_apache_and_user.yml"
        }


        provisioner "file" { 
         ##send_playbook##
         source      = "/Users/biraveennedunchelian/Desktop/info ops/project1/Playbooks/users.yml"
         destination = "/home/ubuntu/setup_apache_and_user.yml"
        }

provisioner "remote-exec" {  ##test_objekt for å mekke en mastervm med kubespray og kubernetes
    inline = [
        "sleep 20",
        "sudo apt update",
        "sudo apt install -y python3-pip software-properties-common git",
        "pip3 install --upgrade pip",
    ]
}


        provisioner "file" {
            source = "/Users/biraveennedunchelian/.config/openstack/clouds.yaml"
            destination ="/home/ubuntu/.config/openstack/clouds.yaml"
        }

        provisioner "remote-exec" {
         inline = [
                "openstack --os-cloud=openstack keypair delete masterKey",
                "openstack --os-cloud=openstack keypair create --public-key ~/.ssh/id_rsa.pub masterKey",     #dette er masterkeyen   
            ]
        }
}