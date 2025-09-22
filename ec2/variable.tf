variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "root_volume_size" {
  type = number
}

variable "additional_volume_size" {
  type = number
}

variable "tf_state_bucket_name" {
  type = string
}