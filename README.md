<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:1E3A8A,50:2563EB,100:67E8F9&height=190&section=header&text=Terraform+Azure+Storage+Modules&fontSize=34&fontColor=ffffff&animation=fadeIn" alt="Terraform storage module architecture banner" width="100%" />

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&weight=600&size=17&pause=1200&color=00C7FF&center=true&vCenter=true&width=900&height=40&lines=Reusable+Infrastructure+%E2%80%A2+Storage+%E2%80%A2+Secure+Defaults" alt="Animated project tagline" />

[![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://developer.hashicorp.com/terraform)
[![Azure](https://img.shields.io/badge/Microsoft-Azure-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Portfolio](https://img.shields.io/badge/Portfolio-MD%20Amirul-181717?style=for-the-badge&logo=github)](https://github.com/haqueamir70-coder)

</div>

> **Portfolio project:** implementation status and limitations are documented below. The diagram describes the intended workflow/architecture and is not proof of a successful production deployment.

## 🗺️ Architecture at a Glance

```mermaid
flowchart TD
  A[Root Module] --> B[Resource Group Module]
  A --> C[Storage Account Module]
  C --> D[Private Blob Container]
  C --> E[Network and TLS Controls]
  C --> F[Outputs]
```

---

# Terraform Azure Storage and Resource Modules

A practice repository for learning how to organize Azure resources into reusable Terraform modules.

## Current layout

The repository includes directories for an Azure resource group and Azure storage account, along with a parent-module path. Inspect the directory contents to verify the exact implementation and module wiring.

## Suggested validation workflow

Run from the Terraform root module:

```bash
terraform fmt -check -recursive
terraform init
terraform validate
terraform plan
```

Review the plan carefully before applying resources to Azure. Storage resources can incur charges, so use a test subscription and clean up resources when finished.

## Module documentation checklist

For each module, document:

- Purpose and resources created
- Required and optional input variables
- Outputs and how callers consume them
- Example usage
- Provider and version requirements
- Naming, region, security, and cost considerations
- Validation steps and safe cleanup instructions

## Security notes

- Do not commit credentials, state files, or real secret-bearing variable files.
- Keep storage network access and public access disabled unless there is a clear requirement.
- Prefer Microsoft Entra ID/RBAC where supported and grant least privilege.
- Enable appropriate encryption, logging, retention, and recovery controls for the intended workload.

## Author

MD Amirul Haque · [GitHub profile](https://github.com/haqueamir70-coder) · [LinkedIn](https://www.linkedin.com/in/md-amirul-haque/)
