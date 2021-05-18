data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "test" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t4g.micro"
  root_block_device {
    volume_size           = 12
    delete_on_termination = true
  }
  
  tags = {
    Name = "test-multi-region"
  }
}
