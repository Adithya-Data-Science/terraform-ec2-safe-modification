data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "lab" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  monitoring    = var.monitoring

  tags = {
    Name        = "terraform-safe-change-lab"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

