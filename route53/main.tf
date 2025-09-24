
resource "aws_route53_zone" "this" {
  name    = var.domain_name
  comment = "Hosted zone for ${var.domain_name}"
}

# A Record
resource "aws_route53_record" "this" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.record_ttl
  records = var.record_values
}
