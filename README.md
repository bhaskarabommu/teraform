This repository contains Terraform code modules for automating AWS cloud infrastructure provisioning. The primary goal is to enable predictable and reusable infrastructure deployment using Infrastructure as Code (IaC) practices.

Overview
The Terraform modules and code in this repository allow you to:

Define and provision AWS resources programmatically.

Use reusable modules and configurations for cloud resources like EC2, VPC, ECS, etc.

Prerequisites
Active AWS Account: Required permissions to create/modify AWS resources (EC2, VPC, IAM, etc.).

Terraform: Install Terraform CLI (v0.13.0 or above recommended).

AWS CLI: (Optional, but recommended for managing and testing credentials).

Git: For cloning and contributing to this repository.

Note: Avoid using root AWS credentials. Use IAM users/roles with the principle of least privilege.
