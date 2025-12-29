resource "aws_acmpca_certificate_authority" "root" {
  type               = "ROOT"
  key_algorithm      = "RSA_2048"
  signing_algorithm  = "SHA256WITHRSA"
  subject {
    common_name = var.root_ca_common_name
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-root-ca"
    Environment = var.environment
  }
}

resource "aws_acmpca_certificate_authority_certificate" "root_cert" {
  certificate_authority_arn = aws_acmpca_certificate_authority.root.arn
  certificate               = aws_acmpca_certificate_authority.root.certificate
  certificate_chain         = aws_acmpca_certificate_authority.root.certificate_chain
}

# Intermediate CA for issuing leaf certs
resource "aws_acmpca_certificate_authority" "intermediate" {
  type               = "SUBORDINATE"
  key_algorithm      = "RSA_2048"
  signing_algorithm  = "SHA256WITHRSA"
  subject {
    common_name = "${var.project_name}-${var.environment}-IntermediateCA"
  }
  tags = {
    Name        = "${var.project_name}-${var.environment}-intermediate-ca"
    Environment = var.environment
  }
}

# Example issued certificate for a service
resource "aws_acm_certificate" "service_cert" {
  domain_name       = "${var.service_name}.${var.domain_name}"
  certificate_authority_arn = aws_acmpca_certificate_authority.intermediate.arn
  validation_method = "DNS"

  tags = {
    Name        = "${var.project_name}-${var.environment}-service-cert"
    Environment = var.environment
  }
}
