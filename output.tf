# Define output values
output "instance_id" {
  value = aws_instance.ec2_public.id
}

output "public_ip" {
  value = aws_instance.ec2_public.public_ip
}