output "myoutput" {
value = [aws_instance.myserver[0].id, aws_instance.myserver[1].id, aws_instance.myserver[2].id]
}
