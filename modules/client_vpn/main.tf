resource "aws_ec2_client_vpn_endpoint" "this" {
  description            = "${var.project_name}-${var.environment}-client-vpn"
  client_cidr_block      = var.vpn_cidr
  server_certificate_arn = var.server_cert_arn
  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = var.client_ca_cert_arn
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn_logs.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn_logs.name
  }

  split_tunnel = true
  transport_protocol = "udp"

  tags = {
    Name        = "${var.project_name}-${var.environment}-client-vpn"
    Environment = var.environment
  }
}

resource "aws_cloudwatch_log_group" "vpn_logs" {
  name              = "/aws/vpn/${var.project_name}-${var.environment}"
  retention_in_days = 30
}

resource "aws_cloudwatch_log_stream" "vpn_logs" {
  name           = "vpn-connection-logs"
  log_group_name = aws_cloudwatch_log_group.vpn_logs.name
}

# Associate VPN with subnets
resource "aws_ec2_client_vpn_network_association" "this" {
  count                  = length(var.subnet_ids)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  subnet_id              = var.subnet_ids[count.index]
}

# Authorization rules
resource "aws_ec2_client_vpn_authorization_rule" "this" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.this.id
  target_network_cidr    = var.vpc_cidr
  authorize_all_groups   = true
}
