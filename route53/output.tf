output "zone_id" {
  description = "The hosted zone ID"
  value       = aws_route53_zone.this.zone_id
}

output "record_fqdn" {
  description = "The fully qualified domain name of the record"
  value       = aws_route53_record.this.fqdn
}
