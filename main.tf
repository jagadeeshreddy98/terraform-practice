resource "aws_instance" "myserver" {
  tags = {
  Name = var.iname
  }
  ami           = var.ami_id
  instance_type = var.itype
  count         = var.icount
  root_block_device {
    volume_size = var.ivolume
  }
}

variable "iname" {
  description = "this is name of server"
  type        = string
  default     = "application"
}

variable "ami_id" {
  description = "ami"
  type        = string
  default     = "ami-0aa78f446b4499266"
}

variable "itype" {
  description = "size cpu"
  type        = string
  default     = "t3.micro"
}

variable "icount" {
  description = "no of servers"
  type        = number
  default     = 3
}

variable "ivolume" {
  description = "volume"
  type        = number
  default     = 15
}

