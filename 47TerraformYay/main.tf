resource "aws_instance" "vm" {
  count         = var.vm_count
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID (example)
  instance_type = var.machine_type

  tags = {
    Name = "vm-${var.environment}-${count.index + 1}"
    Environment = var.environment
  }

  # Enable a public IP
  associate_public_ip_address = true
}
