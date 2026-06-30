# AWS Highly Available Web Application Infrastructure

## Project Overview

This project provisions a highly available, scalable, and secure AWS infrastructure for hosting a web application.

The infrastructure is deployed across two Availability Zones to provide high availability and fault tolerance. It includes public and private subnets, load balancers, Auto Scaling Groups, Amazon RDS, CloudFront, Route 53, monitoring, and logging services.

---

## Architecture Overview

The architecture consists of:

- Amazon VPC
- Two Availability Zones (ap-south-1a and ap-south-1b)
- Public Subnets
- Private Application Subnets
- Private Database Subnets
- Internet Gateway
- NAT Gateway
- External Application Load Balancer
- Internal Application Load Balancer
- Auto Scaling Groups
- EC2 Web Servers
- EC2 Application Servers
- Amazon RDS (Primary & Standby)
- Amazon Route 53
- Amazon CloudFront
- Amazon S3
- Amazon SNS
- Amazon CloudWatch
- AWS CloudTrail
- IAM Roles

---

# Infrastructure Components

## Networking

- One Amazon VPC
- Public and Private Subnets across two Availability Zones
- Internet Gateway for internet connectivity
- NAT Gateway for outbound internet access from private subnets
- Route Tables for public and private routing

---

## Compute Layer

### Web Tier

- EC2 instances deployed in public subnets
- Managed by Auto Scaling Group
- Traffic distributed using External Application Load Balancer

### Application Tier

- EC2 instances deployed in private subnets
- Managed by Auto Scaling Group
- Accessible only through Internal Load Balancer

---

## Database Layer

Amazon RDS PostgreSQL

- Primary Database
- Standby Database
- Multi-AZ deployment
- Private Database Subnets

Database is not publicly accessible.

---

## Monitoring

- Amazon CloudWatch for monitoring EC2 instances and infrastructure
- Amazon SNS for notifications
- AWS CloudTrail for auditing API activities

---

## Storage

Amazon S3 is used for:

- VPC Flow Logs
- Application Logs
- CloudTrail Logs

---

## DNS & CDN

Route 53

- DNS management

CloudFront

- Content Delivery Network
- Improved latency
- Caching static content

---

# Setup Instructions

## Prerequisites

Install the following tools:

- Terraform
- AWS CLI
- Git
- Visual Studio Code

---

## Configure AWS Credentials

```bash
aws configure
```

Provide:

```
AWS Access Key ID
AWS Secret Access Key
Region: ap-south-1
Output Format: json
```

---

## Clone Repository

```bash
git clone <repository-url>

cd aws-infra
```

---

## Initialize Terraform

```bash
terraform init
```

Terraform downloads the AWS provider and initializes the project.

---

## Validate Configuration

```bash
terraform validate
```

Checks the Terraform syntax.

---

## Review Execution Plan

```bash
terraform plan
```

Displays resources that Terraform will create.

---

## Deploy Infrastructure

```bash
terraform apply
```

Type:

```
yes
```

Terraform provisions the infrastructure.

---

## Verify Resources

Verify the following resources are created:

- VPC
- Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- EC2 Instances
- Auto Scaling Groups
- Load Balancers
- RDS Database
- CloudWatch
- CloudTrail
- SNS
- S3 Bucket

---

## Destroy Infrastructure

```bash
terraform destroy
```

Removes all AWS resources.

---

# Assumptions Made

The following assumptions were made while designing the infrastructure:

- Deployment region is **ap-south-1**
- Two Availability Zones are available.
- Terraform has sufficient IAM permissions.
- SSH access is allowed only through the Bastion/Web tier.
- RDS is deployed in private subnets.
- CloudFront is used to cache static content.
- Application servers do not require public IP addresses.
- Auto Scaling Groups handle traffic spikes automatically.
- CloudWatch monitors the infrastructure.
- CloudTrail stores logs in Amazon S3.

---

# Design Decisions

## Multi-AZ Deployment

Resources are distributed across two Availability Zones.

Benefits:

- High Availability
- Fault Tolerance
- Disaster Recovery

---

## Public and Private Subnets

Public Subnets contain:

- Load Balancer
- NAT Gateway
- Web Servers

Private Subnets contain:

- Application Servers
- Database Servers

This improves security by isolating backend resources.

---

## Layered Architecture

Infrastructure is divided into:

- Presentation Layer
- Application Layer
- Database Layer

This improves scalability and simplifies maintenance.

---

## Auto Scaling

Auto Scaling Groups automatically:

- Launch new EC2 instances
- Remove unhealthy instances
- Scale based on demand

---

## Load Balancers

External ALB

Handles internet traffic.

Internal ALB

Routes traffic to private application servers.

This separates external and internal traffic.

---

## Database Design

Amazon RDS is deployed in private subnets.

Benefits:

- Improved security
- High availability
- Automatic failover

---

## Monitoring

CloudWatch provides:

- Metrics
- Alarms
- Logs

SNS sends email notifications when alarms are triggered.

CloudTrail records AWS API activity for auditing.

---

# Trade-offs Considered

## NAT Gateway

### Advantages

- Secure internet access for private instances
- AWS managed service
- Highly available

### Trade-off

- Additional AWS cost compared to a NAT instance.

---

## Multi-AZ Deployment

### Advantages

- High Availability
- Automatic Failover

### Trade-off

- Increased infrastructure cost.

---

## Auto Scaling

### Advantages

- Automatic scaling
- High availability
- Better performance during peak traffic

### Trade-off

- Slight increase in management complexity.

---

## CloudFront

### Advantages

- Reduced latency
- Faster content delivery
- Lower origin load

### Trade-off

- Additional configuration and CDN charges.

---

## CloudTrail Logging

### Advantages

- Security auditing
- Compliance
- Activity tracking

### Trade-off

- S3 storage costs increase as log volume grows.

---

# Security Considerations

- Private resources do not have public IP addresses.
- Security Groups restrict inbound traffic.
- Database is deployed only in private subnets.
- IAM Roles provide temporary credentials.
- CloudTrail captures all AWS API activity.
- CloudWatch monitors infrastructure health.

---

# Future Improvements

- AWS WAF
- AWS Shield
- Secrets Manager
- Systems Manager (SSM)
- VPC Endpoints
- AWS Backup
- Terraform Remote Backend (S3 + DynamoDB)
- CI/CD using GitHub Actions or Jenkins

---

# Architecture Summary

```
User
    │
Route53
    │
CloudFront
    │
External ALB
    │
Auto Scaling Group
    │
Web Servers
    │
Internal ALB
    │
Application Servers
    │
Amazon RDS (Primary / Standby)

CloudWatch
SNS
CloudTrail
S3
IAM
```

This architecture provides a secure, scalable, highly available, and production-ready environment for deploying modern web applications on AWS.
