<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:172554,50:7C3AED,100:38BDF8&height=190&section=header&text=Terraform+Azure+Storage+Modules&fontSize=32&fontColor=ffffff&animation=fadeIn" alt="Terraform Azure Storage Modules project banner" width="100%" />

<img src="https://readme-typing-svg.demolab.com/?font=Inter&weight=600&size=16&pause=1600&color=38BDF8&center=true&vCenter=true&width=900&height=36&lines=Terraform+Azure+Storage+Modules+%E2%80%A2+Architecture+%E2%80%A2+Automation+%E2%80%A2+Security" alt="Animated project focus line" />

![Terraform](https://img.shields.io/badge/Infrastructure+as+Code-844FBA?style=for-the-badge&logo=terraform&logoColor=white) ![Azure](https://img.shields.io/badge/Storage+Services-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white) ![Security](https://img.shields.io/badge/Secure+Defaults-0F766E?style=for-the-badge)

</div>

---

# Terraform Azure Storage Modules

> **Status:** Reusable Terraform module learning project with a root composition layer, typed inputs, outputs, secure storage defaults and GitHub Actions validation. This is not a deployed production platform.

## Architecture

```mermaid
flowchart TB
  Inputs[Typed root variables] --> Root[Root Terraform module]
  Root --> RG[Resource group child module]
  Root --> SA[Storage account child module]
  RG --> Outputs[Root outputs]
  SA --> Outputs
```

## Modules

| Module | Responsibility |
|---|---|
| `azurerm_resource_group` | Create one or more resource groups with `for_each` |
| `azurerm_storage_account` | Create one or more StorageV2 accounts with secure transport/network defaults |

The root module composes both child modules. Storage account resource group names are explicit inputs; ensure each referenced group is created by this configuration or already exists in the target subscription.

## Prerequisites

- Terraform CLI 1.6+
- Azure CLI authenticated to a test subscription
- Permission to create resource groups and storage accounts

## Validate

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

## Configure a plan

Copy `terraform.tfvars.example` to `terraform.tfvars`, choose a globally unique storage account name (3–24 lowercase letters/numbers), and review the full plan:

```bash
terraform plan -out=tfplan
terraform show -no-color tfplan
```

Apply only after approval. This repository does not configure remote state or create private endpoints. Storage accounts default to public network access disabled and shared-key access disabled, so a workload will need an approved private endpoint/VNet path and Microsoft Entra data-plane authorization before it can access blob data.

## Security

- HTTPS-only, TLS 1.2 minimum, shared-key authentication disabled and public network access disabled.
- Do not commit Terraform state, plan files, credentials or real `*.tfvars`.
- Configure encrypted remote state, access control, versioning and locking before team use.
- Add private endpoints, private DNS and scoped RBAC assignments for a real workload; validate DNS and data-plane access from the intended network.

## CI

GitHub Actions checks formatting, validates the root module with a backend-free initialization and runs an advisory Checkov scan. Triage findings before using this as a blocking security gate. CI does not deploy Azure resources or validate subscription permissions.

## Author

MD Amirul Haque · [GitHub profile](https://github.com/haqueamir70-coder) · [LinkedIn](https://www.linkedin.com/in/md-amirul-haque/)


## Architecture and interview preparation

See the [architecture diagram and interview questions](docs/README.md) for the repository-specific design walkthrough and technical interview guide.
