output "vpc_id" {
  value = module.network.vpc_id
}

output "nlb_dns_name" {
  value = module.nlb_mtls_service.nlb_dns_name
}

output "client_vpn_endpoint_id" {
  value = module.client_vpn.client_vpn_endpoint_id
}

output "service_record_fqdn" {
  value = module.dns.service_record_fqdn
}
