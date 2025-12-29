# Terraform execution role (example)
resource "aws_iam_role" "terraform_role" {
  name = "${var.project_name}-${var.environment}-terraform-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name        = "${var.project_name}-${var.environment}-terraform-role"
    Environment = var.environment
  }
}

# Scoped policy for Terraform-managed resources
resource "aws_iam_role_policy" "terraform_policy" {
  role = aws_iam_role.terraform_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "ec2:Describe*",
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet",
          "ec2:CreateInternetGateway",
          "ec2:DeleteInternetGateway",
          "ec2:CreateRouteTable",
          "ec2:DeleteRouteTable",
          "ec2:AssociateRouteTable",
          "ec2:DisassociateRouteTable",
          "ec2:CreateNatGateway",
          "ec2:DeleteNatGateway",
          "acm-pca:*",
          "acm:*",
          "elasticloadbalancing:*",
          "logs:*",
          "config:*",
          "route53:*",
          "iam:GetRole",
          "iam:PassRole"
        ]
        Resource = [
        "arn:aws:s3:::my-terraform-state-bucket",
        "arn:aws:s3:::my-terraform-state-bucket/dev/*"
      ]
      }
    ]
  })
}
