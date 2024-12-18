output "public_ips" {
  description = "Public IP addresses of the created instances"
  value       = aws_instance.vm[*].public_ip
  sensitive   = true
}
