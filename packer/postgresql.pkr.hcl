packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "ssh_key_file_path" {
  type    = string
  default = "/path/to/ssh_key"
}

source "amazon-ebs" "postgresql" {
  instance_type        = "t3.micro"
  source_ami           = "ami-0022aedcf41249b7f"
  ami_name             = "postgresql"
  ssh_keypair_name     = "ec2"
  ssh_username         = "ec2-user"
  ssh_private_key_file = "${var.ssh_key_file_path}"
  launch_block_device_mappings {
    device_name           = "/dev/sda1"
    volume_size           = 150
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

build {
  name = "postgresql"
  sources = [
    "source.amazon-ebs.postgresql"
  ]
  provisioner "ansible" {
    playbook_file = "../ansible/site.yml"
    extra_arguments = [
      "-e",
      "'ansible_python_interpreter=/usr/bin/python3.9'"
    ]
  }
}