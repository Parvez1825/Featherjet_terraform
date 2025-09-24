variable "domain_name" {
  description = "The domain name for the hosted zone"
  type        = string
}

variable "record_name" {
  description = "Record name (example: featherjet.com or api.featherjet.com)"
  type        = string
}

variable "record_type" {
  description = "The DNS record type (A, CNAME, etc.)"
  type        = string
  default     = "A"
}

variable "record_ttl" {
  description = "TTL value for the record"
  type        = number
  default     = 300
}

variable "record_values" {
  description = "List of record values (IP addresses or CNAMEs)"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for private hosted zone (leave empty for public)"
  type        = string
  default     = ""
}
