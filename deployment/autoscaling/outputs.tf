output "public_instances" {
    value = aws_launch_configuration.pub_instance.*.id
}