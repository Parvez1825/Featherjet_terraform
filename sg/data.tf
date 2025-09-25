data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "devops-terraform-12345"
    key    = "vpc/vpc.tfstate"
    region = "us-east-1"
  }
  
}
