# Azure Infrastructure Automation with Terraform and Jenkins

A hands-on Azure DevOps portfolio project that uses Terraform to provision a Resource Group, Virtual Network, and subnet, with Jenkins orchestrating infrastructure actions.

## What this repository demonstrates

- Terraform configuration for Azure using the AzureRM provider
- A reusable Virtual Network module with configurable network and subnet inputs
- Environment-level composition of a Resource Group and module
- Jenkins pipeline parameters for plan, apply, and destroy
- Azure authentication through Jenkins Credentials IDs rather than hard-coded cloud credentials

## Repository structure

~~~text
.
├── Jenkinsfile
├── live/
│   ├── main.tf
│   ├── modules.tf
│   └── provider.tf
└── modules/
    └── vpc/
        └── azure/
            ├── main.tf
            ├── variables.tf
            └── outputs.tf
~~~

## Jenkins workflow

The Jenkins pipeline checks out the repository, initializes Terraform, and runs a plan for the requested action. Apply and destroy are selected explicitly through pipeline parameters.

Required Jenkins credentials:

- azure-client-id
- azure-client-secret
- azure-subscription-id
- azure-tenant-id

These credential IDs are references only. No credential values, Terraform state, or *.tfvars files are included in this repository.

## Run locally

1. Authenticate to Azure using your preferred secure method.
2. From live/, run:

~~~bash
terraform init
terraform validate
terraform plan
~~~

Review every plan before applying changes. Use a separate state backend for real environments.

## Notes

This is a learning portfolio project. It is intentionally scoped to the infrastructure and pipeline features present in this repository; it is not presented as a production deployment.
