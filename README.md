# Terraform Azure Remote State with GitHub Actions

A practical Infrastructure as Code project demonstrating how to manage
Terraform remote state using Azure Storage and automate Terraform workflows
with GitHub Actions.

## 🚀 What This Project Demonstrates

- Terraform Remote State
- Azure Storage Backend
- Terraform Modules
- GitHub Actions CI/CD
- Terraform Format & Validation
- Terraform Plan
- Terraform Apply
- Feature Branch Workflow
- Pull Request based Infrastructure Changes
- Infrastructure as Code best practices

## 🏗️ Architecture

Developer
    |
    v
GitHub Repository
    |
    +---- Feature Branch
    |         |
    |         v
    |    Pull Request
    |         |
    |         v
    |    GitHub Actions
    |         |
    |         +---- terraform fmt
    |         +---- terraform validate
    |         +---- terraform plan
    |
    v
main branch
    |
    v
Terraform Apply
    |
    v
Azure

Terraform State
    |
    v
Azure Storage Account
    |
    v
Blob Container
    |
    v
terraform.tfstate

## 📂 Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── environments/
│   └── dev/
│       ├── backend.tf
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── modules/
│   └── resource-group/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── .gitignore
└── README.md
