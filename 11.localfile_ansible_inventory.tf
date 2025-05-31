resource "local_file" "ansible-inventory-file" {
  content = templatefile("publicservers.tpl",
    {
      testserver01    = aws_instance.webservers.0.public_ip
      testserver02    = aws_instance.webservers.1.public_ip
      testserver03    = "" # Removed as we only have 2 AZs
      pvttestserver01 = aws_instance.webservers.0.private_ip
      pvttestserver02 = aws_instance.webservers.1.private_ip
      pvttestserver03 = "" # Removed as we only have 2 AZs
    }
  )
  filename = "${path.module}/invfile"
}