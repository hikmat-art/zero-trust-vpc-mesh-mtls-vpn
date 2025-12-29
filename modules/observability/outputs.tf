output "flow_logs_log_group" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.name
}

output "config_recorder_name" {
  value = aws_config_configuration_recorder.this.name
}
