resource "aws_instance" "myserver" {
  tags = {
    Name = "${terraform.workspace}-server"
    env  = "dev"
  }

  ami           = "ami-0aa78f446b4499266"
  instance_type = local.instance_types[terraform.workspace]
  key_name      = "jagadeeshwar"
  root_block_device {
    volume_size = 18
  }
}
