
# Create an IAM Role
resource "aws_iam_role" "ec2_role" {
  name               = "my-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

# IAM policy document that allows EC2 to assume the role
data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions   = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Attach an IAM policy to the EC2 instance role (e.g., EC2 Read-Only Access)
resource "aws_iam_role_policy_attachment" "ec2_role_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

# Create the IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "my-ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "vm" {
  count         = var.vm_count
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID (example)
  key_name               = "your-key-name"
  subnet_id              = "subnet-xxxxxxxx"
  security_group         = "sg-xxxxxxxx" 
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  instance_type = var.machine_type
  ebs_optimized = true
  monitoring = true

  tags = {
    Name = "vm-${var.environment}-${count.index + 1}"
    Environment = var.environment
  }

  # Enable a public IP
  associate_public_ip_address = true
}
