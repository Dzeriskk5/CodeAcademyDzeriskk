variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "machine_type" {
  description = "Type of machine (t2.micro, t2.small, t2.medium)"
  type        = string
  default     = "t2.micro"
  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.machine_type)
    error_message = "Machine type must be one of t2.micro, t2.small, or t2.medium."
  }
}

variable "environment" {
  description = "Environment (dev, stage, prod)"
  type        = string
}

variable "vm_count" {
  description = "Number of VMs to create"
  type        = number
  default     = 3
}
variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

variable "security_group" {
  description = "The security group ID for the EC2 instance"
  type        = string
}