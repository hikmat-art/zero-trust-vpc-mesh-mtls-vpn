output "root_ca_arn" {
  value = aws_acmpca_certificate_authority.root.arn
}

output "intermediate_ca_arn" {
  value = aws_acmpca_certificate_authority.intermediate.arn
}

output "service_cert_arn" {
  value = aws_acm_certificate.service_cert.arn
}
