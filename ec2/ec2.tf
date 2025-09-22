data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.ubuntu.id
  key_name = aws_key_pair.kyc_app_public_key.key_name
  instance_type          = var.instance_type
  associate_public_ip_address = "true"
  subnet_id              = data.terraform_remote_state.network.outputs.subnet_ids[0]
  vpc_security_group_ids = data.terraform_remote_state.sg.outputs.sg-id
  iam_instance_profile = aws_iam_instance_profile.profile.name
  # Root volume

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp3"
    volume_size = var.root_volume_size
  }
  ## Additional volume

    ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp3"
    volume_size = var.additional_volume_size
  }
  
  tags = {
    Name = "application-ec2"
  }

}



