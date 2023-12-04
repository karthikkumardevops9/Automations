provider "aws" {
  region = "ca-central-1"  # Change this to your desired AWS region
}

resource "aws_instance" "ubuntu_instances" {
  count         = 10
  ami           = "ami-06873c81b882339ac"  # Ubuntu 20.04 LTS AMI ID, replace with the desired version
  instance_type = "t2.micro"
  key_name      = "testautomation2"

  tags = {
    Name = "LambdaDemo-${count.index + 1}"
  }
}


output "volume_ids" {
  value = aws_instance.ubuntu_instances[*].root_block_device[*].volume_id
}

output "private_ips" {
  value = aws_instance.ubuntu_instances[*].private_ip
}