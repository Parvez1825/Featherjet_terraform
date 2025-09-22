rules = [
  {
    port        = 8081
    proto       = "tcp"
    cidr_blocks = ["0.0.0.0/0", "10.0.0.0/16"]
    description = "Application port"
  },
  {
    port        = 22
    proto       = "tcp"
    cidr_blocks = ["49.43.225.115/32"]
    description = "ssh connect from my IP only"
  }

]







