# Zero-to-Hero Project Guide — Azure Storage Terraform module

## 1. Business scenario
Application teams need blob storage but must not independently choose unsafe public access, TLS, redundancy, retention and identity defaults.

## 2. Architecture and end-to-end flow
Root caller supplies typed configuration; child module provisions Storage Account/container/private endpoint/DNS and returns non-secret IDs/endpoints.

## 3. Tool-by-tool inventory
Terraform, AzureRM, Azure Storage, Blob containers, Private Endpoint, Private DNS, Entra ID/RBAC, lifecycle rules, versioning/soft delete, Checkov.

## 4. What you must understand before implementation
Understand the business requirement and success criteria first. Then learn the relevant network/security primitives, identity model, service limits, configuration files, deployment lifecycle, observability signals and recovery strategy. For every tool, be able to explain: what problem it solves, why it was selected, what alternative exists, how it is configured, how it fails and how you verify it.

## 5. Implementation / operations sequence
1. Read the repository README, source files, Terraform modules, manifests and workflow YAML.
2. Map every resource and tool to the architecture diagram.
3. Run local formatting, validation, unit tests and static scans.
4. Review the plan/build artifact before any deployment.
5. Deploy only to an authorized sandbox with least-privilege identity.
6. Verify actual service behavior, network paths, security boundaries and monitoring.
7. Record evidence, cleanup steps, cost and rollback procedure.

## 6. Scenario-based interview questions and answers
**Q: Shared Key disabled breaks app.** A: Migrate clients to Entra authentication and assign minimum data-plane roles before disabling; test SDK support.

**Q: LRS vs ZRS vs GRS?** A: Local copies vs zone-level synchronous copies vs paired-region asynchronous replication; choose based on availability and DR requirements.

**Q: Accidentally deleted blob?** A: Recover via soft delete/versioning if configured and within retention; test restore regularly.

**Q: Safe module upgrade?** A: Review plan for replacement, preserve data, test in non-prod and avoid force replacement of populated accounts.

## 7. Troubleshooting method
Start with the user-visible symptom; establish scope and recent changes; inspect logs/events/metrics; verify identity and permissions; verify DNS/network path; inspect resource limits and service health; isolate one layer at a time; mitigate safely; then document root cause and prevention.

## 8. Security, reliability and cost
Use least privilege, secret management, encrypted transport/storage, explicit network boundaries, patching/scanning, backups, actionable alerts, capacity planning and owner accountability. Estimate cost drivers before scaling or enabling verbose diagnostics.

## 9. Zero-to-Hero study plan
**Foundation:** Linux, Git, networking, YAML/JSON and cloud fundamentals.  
**Project tools:** learn each tool in the inventory and reproduce the repository workflow.  
**Hands-on:** deploy a disposable environment, break one component deliberately, diagnose it and restore service.  
**Interview:** explain the business scenario, diagram, tool choices, data/request flow, security controls, failure modes, cost trade-offs and evidence without reading notes.

## 10. Evidence and scope honesty
This guide is a learning and interview companion. The repository's code, workflow runs and deployment evidence determine what is implemented. Explicitly label each capability as implemented, CI-validated, cloud-deployed or planned. Never claim a tool is used in the live project merely because it appears in a conceptual architecture.
