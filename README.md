# aws_infra_provisioning

## Overview
The purpose of this solution is to provision and manage cloud-based infrastructure using AWS services and Terraform

## Prerequisites:
Visual Studio Code (Version: 1.92.0) - https://code.visualstudio.com/
Terraform (Version: v1.9.3) - https://developer.hashicorp.com/terraform/install
AWS CLI (Version: v2.17.24) - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
hashicorp/aws (Version: v5.61.0) - https://releases.hashicorp.com/terraform-provider-aws/
<details> 
 <summary>
  AWS CLI IAM user with permissions
 </summary>  
 
```json
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"autoscaling:DescribeAutoScalingGroups",
				"autoscaling:DescribeScalingActivities",
				"ec2:CreateTags",
				"ec2:DescribeAddresses",
				"ec2:DescribeInternetGateways",
				"ec2:DescribeLaunchTemplateVersions",
				"ec2:DescribeLaunchTemplates",
				"ec2:DescribeNatGateways",
				"ec2:DescribeNetworkAcls",
				"ec2:DescribeNetworkInterfaces",
				"ec2:DescribeRouteTables",
				"ec2:DescribeSecurityGroups",
				"ec2:DescribeSubnets",
				"ec2:DescribeVpcClassicLink",
				"ec2:DescribeVpcClassicLinkDnsSupport",
				"ec2:DescribeVpcs",
				"ec2:DisassociateAddress",
				"ec2:DisassociateRouteTable",
				"ec2:ReleaseAddress",
				"elasticloadbalancing:CreateListener",
				"elasticloadbalancing:CreateLoadBalancer",
				"elasticloadbalancing:DescribeListeners",
				"elasticloadbalancing:DescribeLoadBalancerAttributes",
				"elasticloadbalancing:DescribeLoadBalancers",
				"elasticloadbalancing:DescribeTags",
				"elasticloadbalancing:DescribeTargetGroupAttributes",
				"elasticloadbalancing:DescribeTargetGroups",
				"elasticloadbalancing:SetSecurityGroups",
				"rds:AddTagsToResource",
				"rds:ListTagsForResource",
				"sts:GetCallerIdentity"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"autoscaling:AttachLoadBalancerTargetGroups",
				"autoscaling:CreateAutoScalingGroup",
				"autoscaling:DeleteAutoScalingGroup",
				"autoscaling:DetachLoadBalancerTargetGroups",
				"autoscaling:SetInstanceProtection",
				"autoscaling:UpdateAutoScalingGroup"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "ec2:AllocateAddress",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:DetachNetworkInterface",
				"ec2:RunInstances"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:AttachInternetGateway",
				"ec2:CreateInternetGateway",
				"ec2:DeleteInternetGateway",
				"ec2:DetachInternetGateway"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:CreateLaunchTemplate",
				"ec2:DeleteLaunchTemplate"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:CreateNatGateway",
				"ec2:DeleteNatGateway"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:DetachNetworkInterface",
				"ec2:RunInstances"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:AssociateRouteTable",
				"ec2:CreateRoute",
				"ec2:CreateRouteTable",
				"ec2:DeleteRouteTable"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:AuthorizeSecurityGroupEgress",
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:CreateSecurityGroup",
				"ec2:DeleteSecurityGroup",
				"ec2:RevokeSecurityGroupEgress",
				"ec2:RunInstances"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:CreateNatGateway",
				"ec2:CreateSubnet",
				"ec2:DeleteSubnet",
				"ec2:ModifySubnetAttribute",
				"ec2:RunInstances"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"ec2:AttachInternetGateway",
				"ec2:CreateRouteTable",
				"ec2:CreateSubnet",
				"ec2:CreateVpc",
				"ec2:DeleteVpc",
				"ec2:DescribeVpcAttribute",
				"ec2:DetachInternetGateway",
				"ec2:ModifyVpcAttribute"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "ec2:RunInstances",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "elasticloadbalancing:DeleteListener",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "elasticloadbalancing:DeleteListener",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"elasticloadbalancing:AddTags",
				"elasticloadbalancing:DeleteLoadBalancer",
				"elasticloadbalancing:ModifyLoadBalancerAttributes"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"elasticloadbalancing:CreateTargetGroup",
				"elasticloadbalancing:DeleteTargetGroup",
				"elasticloadbalancing:ModifyTargetGroupAttributes"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "iam:CreateServiceLinkedRole",
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"kms:CreateGrant",
				"kms:Decrypt",
				"kms:DescribeKey",
				"kms:GenerateDataKey"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"rds:CreateDBInstance",
				"rds:CreateTenantDatabase",
				"rds:DeleteDBInstance",
				"rds:DeleteTenantDatabase",
				"rds:DescribeDBInstances"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"rds:CreateDBSubnetGroup",
				"rds:DeleteDBSubnetGroup",
				"rds:DescribeDBSubnetGroups"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"rds:CreateTenantDatabase",
				"rds:DeleteTenantDatabase"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"secretsmanager:CreateSecret",
				"secretsmanager:TagResource"
			],
			"Resource": "*"
		},
		{
			"Effect": "Allow",
			"Action": "ssm:GetParameters",
			"Resource": "*"
		}
	]
}
```

 
</details>

## Deployment
1. Clone the repo:
```
git clone https://github.com/st0yanDimitrov/2-tier-webapp.git
```
2. Initialize the Terraform configuration:
```
terraform init
```
3. Preview the infrastructure changes:
```
terraform plan
```
4. Create the infrastructure on AWS:
```
terraform apply
```




## Components
EC2 Instances: Run the web application on these instances.
Auto Scaling Group (ASG): Automatically manages web server instances based on scaling policies and ALB health checks.
Application Load Balancer (ALB): Distributes traffic to healthy web servers.
MySQL RDS Database:  MySQL database.
VPC (Virtual Private Cloud): Creates a logically isolated network for our resources.
Subnets: Defines public and private subnets for web servers and the database.
Security Groups: Restricts inbound and outbound traffic for each resource tier.


## File structure:
aws_infra_provisioning
├── main.tf
├── modules
│   ├── .DS_Store
│   ├── asg
│   │   ├── .DS_Store
│   │   ├── ec2-with-asg.tf
│   │   └── variables.tf
│   ├── db
│   │   ├── .DS_Store
│   │   ├── mysql-db.tf
│   │   ├── output.tf
│   │   ├── variables.tf
│   │   └── vpc.tf
│   ├── load_balancer
│   │   ├── load-balancer.tf
│   │   ├── output.tf
│   │   └── variables.tf
│   └── network
│       ├── gateways-private.tf
│       ├── gateways-public.tf
│       ├── output.tf
│       ├── security-groups.tf
│       └── vpc-with-subnets.tf
├── output.tf
├── testing.auto.tfvars
├── user_data.sh
└── variables.tf


## Modules:
1. asg - AutoScalingGroup module
2. db - Database module
3. load_balancer - Load Balancer module
4. network - Network module

## Inputs
Create file named "testing.auto.tfvar" with 'db_username' and 'db_password' variables with correct DB values

## Outputs
"db_endpoint" - DB endpoint
"load_balancer_dns" - Load Balancer DNS record

## Failover Details:
RDS Multi-AZ Deployment: The RDS instance is configured with automatic failover across Availability Zones (AZs) within the chosen region. If the primary instance fails, the standby instance automatically takes over with minimal downtime.
ALB Health Checks: The ALB continuously monitors the health of web servers. If a server becomes unhealthy, the ALB removes it from the traffic distribution until it recovers.
Auto Scaling Group: The ASG automatically replaces unhealthy instances with new ones, ensuring continuous application availability.

