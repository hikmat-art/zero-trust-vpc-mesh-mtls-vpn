# Observability Module

This module provisions monitoring and drift detection for the zero-trust VPC mesh.

## Features
- VPC Flow Logs to CloudWatch
- IAM role/policy for flow logs
- AWS Config recorder and delivery channel
- Drift detection across resources

## Inputs
- `project_name` → Project prefix
- `environment` → Environment name
- `vpc_id` → VPC ID
- `config_bucket_name` → S3 bucket for AWS Config

## Outputs
- `flow_logs_log_group`
- `config_recorder_name`
