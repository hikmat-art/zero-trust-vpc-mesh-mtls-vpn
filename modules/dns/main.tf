resource "aws_route53_zone" "private" {
  name          = var.domain_name
  vpc {
    vpc_id = var.vpc_id
  }
  comment       = "${var.project_name}-${var.environment}-private-zone"
  force_destroy = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-dns"
    Environment = var.environment
  }
}

# Example record for NLB service
resource "aws_route53_record" "service" {
  zone_id = aws_route53_zone.private.zone_id
  name    = "${var.service_name}.${var.domain_name}"
  type    = "A"
  alias {
    name                   = var.nlb_dns_name
    zone_id                = var.nlb_zone_id
    evaluate_target_health = true
  }
}
