# Terraform Azure Remote State with GitHub Actions

This repository shows a simple and production-friendly way to manage Terraform using:

- Azure Storage as the remote backend for Terraform state
- GitHub Actions as the CI/CD workflow
- Azure OIDC authentication for secure deployments
- A minimal Azure setup with Resource Group, VNet, Subnet, and Storage Account

The goal is to keep the code readable, secure, and easy to follow for real-world DevSecOps work.

## Why backend is important

Terraform stores infrastructure state in a file called `terraform.tfstate`. Without a remote backend, state is stored locally on your machine.

That creates problems:

- state can be lost or overwritten
- multiple engineers may work on the same environment
- CI/CD pipelines cannot safely plan and apply consistently
- drift detection becomes difficult

Using Azure Storage as the backend stores the state remotely in a secure, shared location.

Example backend config:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "CHANGE_ME_TF_STATE_RESOURCE_GROUP"
    storage_account_name = "CHANGE_ME_TF_STATE_STORAGE_ACCOUNT"
    container_name       = "CHANGE_ME_TF_STATE_CONTAINER"
    key                  = "preprod.terraform.tfstate"
  }
}
```

This means all team members and GitHub Actions jobs use the same source of truth for infrastructure state.

## Project structure

```text
.
├── .github/
│   └── workflows/
│       └── terraform.yml
├── environment/
│   └── preprod/
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── terraform.tfvars.example
│       └── variables.tf
├── modules/
│   ├── azurerm_rg/
│   ├── azurerm_subnet/
│   ├── azurerm_vnet/
│   └── azurern_sa/
├── .gitignore
├── README.md
└── LICENSE (optional)
```

## What this repo does

- Creates an Azure Resource Group
- Creates a Virtual Network and Subnet
- Creates a Storage Account
- Uses Azure Storage as the Terraform backend
- Uses GitHub Actions to run Terraform checks and deployment
- Uses Azure OIDC instead of static secrets

## Azure pre-requisites

Before using this repo, prepare the following in Azure:

1. Azure subscription and tenant
2. Resource group for Terraform state storage
3. Storage account for backend state
4. Blob container for the tfstate file
5. App registration / service principal for GitHub OIDC
6. Federated credentials for the GitHub repo

Example Azure values you will need:

- subscription ID
- tenant ID
- app/client ID
- state resource group name
- state storage account name
- blob container name

## GitHub repository variables

Set these as GitHub repository variables or environment variables:

```text
ARM_CLIENT_ID
ARM_TENANT_ID
ARM_SUBSCRIPTION_ID
TF_STATE_RESOURCE_GROUP
TF_STATE_STORAGE_ACCOUNT
TF_STATE_CONTAINER
```

Do not hardcode secrets or IDs in Terraform files.

## Terraform backend setup

The backend is configured in:

- [environment/preprod/backend.tf](environment/preprod/backend.tf)

Update placeholders like below before running Terraform:

```hcl
resource_group_name  = "CHANGE_ME_TF_STATE_RESOURCE_GROUP"
storage_account_name = "CHANGE_ME_TF_STATE_STORAGE_ACCOUNT"
container_name       = "CHANGE_ME_TF_STATE_CONTAINER"
```

## Local Terraform workflow

Run these commands from the `environment/preprod` folder:

```bash
cd environment/preprod

terraform init -backend=false
terraform validate
terraform plan
```

If backend configuration is ready in Azure, initialize with backend settings:

```bash
cd environment/preprod

terraform init \
  -backend-config="resource_group_name=CHANGE_ME_TF_STATE_RESOURCE_GROUP" \
  -backend-config="storage_account_name=CHANGE_ME_TF_STATE_STORAGE_ACCOUNT" \
  -backend-config="container_name=CHANGE_ME_TF_STATE_CONTAINER" \
  -backend-config="key=preprod.terraform.tfstate"
```

## GitHub Actions flow

The workflow is defined in:

- [.github/workflows/terraform.yml](.github/workflows/terraform.yml)

The pipeline runs on:

- push to `main`
- pull request to `main`
- manual workflow dispatch

Execution order:

1. `terraform fmt -check`
2. `terraform init`
3. `terraform validate`
4. `terraform plan`
5. `terraform apply` on `main` after merge

This helps enforce consistent quality before any infrastructure changes are applied.

## Azure OIDC authentication

This repo uses Azure OIDC instead of storing long-lived credentials in GitHub secrets.

The key idea:

- GitHub authenticates using its federated identity
- Azure trusts that identity
- Terraform gets temporary credentials without storing secret values in code or repository secrets

This is the recommended secure approach for GitHub Actions + Azure deployments.

## Example variable file

A sample file is available here:

- [environment/preprod/terraform.tfvars.example](environment/preprod/terraform.tfvars.example)

You can copy it and update values as needed:

```bash
copy environment\preprod\terraform.tfvars.example environment\preprod\terraform.tfvars
```

## Important security notes

- Never commit real secrets or credentials
- Never hardcode subscription IDs, tenant IDs, or storage names in source control
- Use GitHub repository variables for environment-specific values
- Never run `terraform destroy` without explicit approval

## Summary

This project is a clear example of:

- remote state management with Azure Storage
- secure Azure login using OIDC
- Terraform automation using GitHub Actions
- simple but production-style IaC patterns

This is a good foundation for building real Azure infrastructure with DevSecOps best practices.

## Next steps

1. Create the Azure Storage backend
2. Configure GitHub repo variables
3. Update `CHANGE_ME_*` placeholders
4. Push code to GitHub
5. Let GitHub Actions validate and deploy

If you want, I can next create a step-by-step Azure setup guide for:

- Azure Storage account creation
- GitHub OIDC app registration
- Terraform backend configuration
- GitHub repo variable setup
