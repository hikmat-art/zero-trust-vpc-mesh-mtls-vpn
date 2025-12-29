output "private_zone_id" {
  value = aws_route53_zone.private.zone_id
}

output "service_record_fqdn" {
  value = aws_route53_record.service.fqdn
}
