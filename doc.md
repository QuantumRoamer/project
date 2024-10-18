Here’s an updated README that includes the RDS, Security Groups, and ALB modules along with their descriptions and usage examples. This will give a comprehensive overview of the entire Terraform setup.

```markdown
# Terraform AWS VPC and WordPress Setup

This repository contains Terraform configurations for setting up an AWS infrastructure with a VPC, public and private subnets, NAT gateway, route tables, and deploying a WordPress application using Amazon ECS.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Infrastructure Overview](#infrastructure-overview)
- [Module Structure](#module-structure)
  - [VPC Module](#vpc-module)
  - [ECS Module](#ecs-module)
  - [RDS Module](#rds-module)
  - [ALB Module](#alb-module)
  - [Security Groups Module](#security-groups-module)
- [Variables](#variables)
- [Outputs](#outputs)
- [Usage](#usage)
- [Cleanup](#cleanup)
- [Contributing](#contributing)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Terraform**: Ensure you have Terraform installed on your local machine. You can download it from the [official Terraform website](https://www.terraform.io/downloads.html).
- **AWS Account**: You need an AWS account to create resources. Configure your AWS CLI with your credentials:
    ```bash
    aws configure
    ```

## Getting Started

1. Clone the repository:
    ```bash
    git clone <repository-url>
    cd <repository-folder>
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Update `terraform.tfvars` with your desired values. This file contains the variables needed for your infrastructure. Make sure to specify the VPC CIDR block and any other required values.

4. Review the planned changes:
    ```bash
    terraform plan
    ```

5. Apply the changes to create the infrastructure:
    ```bash
    terraform apply
    ```

6. Confirm the prompt by typing `yes`.

## Infrastructure Overview

This setup creates:

- A **VPC** with a specified CIDR block.
- **2 Public Subnets** for services that need to be publicly accessible.
- **2 Private Subnets** for internal services (e.g., databases).
- An **Internet Gateway** for public internet access.
- A **NAT Gateway** for allowing private subnets to access the internet.
- Route tables and associations for routing traffic appropriately.
- An **ECS Cluster** with a **WordPress Application** deployed.
- An **RDS Instance** for the WordPress database.
- An **Application Load Balancer** (ALB) to route traffic to the WordPress application.
- **Security Groups** to control traffic to and from the resources.

## Module Structure

The project is organized into the following modules:

### VPC Module

- **Directory**: `modules/vpc`
- **Purpose**: Handles the creation of the VPC, subnets (both public and private), route tables, and gateways.

### ECS Module

- **Directory**: `modules/ecs`
- **Purpose**: Deploys the WordPress application on ECS Fargate, including the task definition, service, and necessary IAM roles for execution and logging.

### RDS Module

- **Directory**: `modules/rds`
- **Purpose**: Creates an RDS instance for the WordPress database, including the necessary security groups and subnet group.

### ALB Module

- **Directory**: `modules/alb`
- **Purpose**: Creates an Application Load Balancer (ALB) to route traffic to the ECS service running the WordPress application.

### Security Groups Module

- **Directory**: `modules/security_groups`
- **Purpose**: Creates security groups for the ECS service and RDS instance to control incoming and outgoing traffic.

## Usage

To access your WordPress application after deployment:

1. Get the public IP address or DNS name of your ECS service.
2. Open a web browser and navigate to `http://<your-public-ip-or-dns>`.

## Cleanup

To remove all resources created by Terraform, run:

```bash
terraform destroy
```
