resource "tls_private_key" "rsa-4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kyc_app_public_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa-4096.public_key_openssh
}

resource "aws_s3_object" "ssh_key" {
  bucket = var.tf_state_bucket_name   
  key    = "keys/${aws_key_pair.kyc_app_public_key.key_name}.pem"
  content = tls_private_key.rsa-4096.private_key_pem

  server_side_encryption = "AES256"
}

