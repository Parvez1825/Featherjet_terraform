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
    cidr_blocks = ["203.197.238.210/32"]
    description = "ssh connect from my IP"
  },

  {
    port        = 22
    proto       = "tcp"
    cidr_blocks = ["172.31.8.2/32"]
    description = "Deploy"
    
  }
]







