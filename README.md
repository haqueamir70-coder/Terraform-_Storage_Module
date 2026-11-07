<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:17112F,45:6D28D9,100:38BDF8&height=215&section=header&text=Azure%20Storage%20Module%20Factory&fontSize=34&fontColor=ffffff&animation=fadeIn" width="100%" alt="Terraform Azure Storage modules"/>

### Storage infrastructure as code · Reusable contracts · Private by default

[![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![Azure Storage](https://img.shields.io/badge/Azure_Storage-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://learn.microsoft.com/azure/storage/)
[![Security](https://img.shields.io/badge/Security-Secure_Defaults-0F766E?style=for-the-badge)](https://learn.microsoft.com/azure/storage/common/storage-security-guide)

**A focused Terraform module composition lab for creating Azure resource groups and StorageV2 accounts through typed inputs and reusable child modules.**

[Architecture](#-architecture) · [Modules](#-module-contracts) · [Quick start](#-quick-start) · [Security model](#-storage-security-model)

</div>

> [!NOTE]
> This is a reusable-module learning project with CI validation. It does not claim a live Azure deployment. The module deliberately disables public network access and shared-key access by default; consuming workloads need an approved private path and identity authorization.

## The problem

Storage resources are easy to create but easy to expose incorrectly. This lab focuses on a repeatable module interface and conservative defaults so storage provisioning can be composed, reviewed and extended without embedding credentials or public-access assumptions.

## Architecture

```mermaid
flowchart TB
  Vars[Typed environment inputs] --> Root[Root composition module]
  Root --> RG[Resource group child module]
  Root --> SA[Storage account child module]
  RG --> Out[Root outputs]
  SA --> Out
  Workload[Future workload identity] -. requires RBAC + private path .-> SA
```

## Module contracts

| Module | Responsibility |
|---|---|
| `azurerm_resource_group` | Create one or more resource groups with stable `for_each` keys |
| `azurerm_storage_account` | Create StorageV2 accounts with secure transport/network defaults |
| Root module | Compose child modules and expose resource identifiers |

Storage account resource-group names are explicit inputs. Ensure each referenced resource group is created by this configuration or already exists in the selected subscription.

## Quick start

### Requirements

- Terraform CLI 1.6+.
- Azure CLI authenticated to a non-production test subscription for planning.
- Permissions to create resource groups and storage accounts.

### Configure

Copy the example variables file and edit it:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Choose a globally unique Storage account name (3–24 lowercase letters and numbers). Confirm the target resource group and region.

### Validate

```bash
terraform fmt -check -recursive
terraform init -backend=false
terraform validate
```

### Review a plan

After backend and provider authentication are configured for the intended environment:

```bash
terraform plan -out=tfplan
terraform show -no-color tfplan
```

Do not apply until the full plan, region/SKU availability and estimated cost have been reviewed. This repository does not configure remote state or create private endpoints.

## Storage security model

- HTTPS-only transport and TLS 1.2 minimum.
- Shared-key authentication disabled.
- Public network access disabled.
- Private blob container.
- No credentials or real variable files committed.

**Connectivity and authorization are separate requirements.** Add a Private Endpoint, private DNS zone/link and a valid VNet route for private connectivity. Assign narrowly scoped Microsoft Entra data-plane roles to the consuming workload identity. Validate DNS resolution and blob operations from the actual client network.

## CI and validation

The GitHub Actions workflow checks formatting, initializes without a remote backend, validates the root composition and runs an advisory Checkov scan. These checks do not deploy Azure resources or prove that a workload can access the storage account.

## Repository map

```text
modules/
  azurerm_resource_group/
  azurerm_storage_account/
main.tf
variables.tf
outputs.tf
terraform.tfvars.example
.github/workflows/
docs/
```

## Production-hardening checklist

- [ ] Configure encrypted remote state, versioning, locking and access restrictions.
- [ ] Add Private Endpoint and private DNS integration.
- [ ] Assign least-privilege data-plane RBAC to workload identities.
- [ ] Enable diagnostic settings and retention appropriate to the workload.
- [ ] Define backup, recovery and lifecycle policies.
- [ ] Validate access from the intended private network.
- [ ] Review cost and data-residency requirements.

## Documentation

- [Architecture and interview guide](docs/README.md)
- [Zero-to-hero guide](docs/ZERO-TO-HERO.md)
- [Advanced interview bank](docs/ADVANCED-INTERVIEW-BANK.md)

## Maintainer

**MD Amirul Haque** · [GitHub](https://github.com/haqueamir70-coder) · [LinkedIn](https://www.linkedin.com/in/md-amirul-haque/)

<sub>Private by default. Identity for access. Infrastructure defined as code.</sub>
