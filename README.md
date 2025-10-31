# multi-env-terraform-modules

A collection of reusable Terraform modules for managing infrastructure across multiple environments (e.g., development, staging, production) using [HashiCorp Configuration Language (HCL)](https://www.terraform.io/docs/language/index.html).

## Overview

This repository provides modular, environment-aware Terraform configurations. It helps teams standardize infrastructure provisioning and management across different environments, reducing duplication and improving maintainability.

- **100% HCL:** All modules are written in HCL.
- **Multi-environment Support:** Easily provision resources for dev, staging, prod, or any custom environment.
- **Reusable Modules:** Designed for composability and reuse.
- **Best Practices:** Follows Terraform and cloud infrastructure best practices.

## Directory Structure

```
multi-env-terraform-modules/
├── modules/            # Contains individual reusable modules
│   ├── <module1>/
│   ├── <module2>/
│   └── ...
├── environments/       # Environment-specific configurations
│   ├── dev/
│   ├── staging/
│   ├── prod/
│   └── ...
├── examples/           # Usage examples for modules
│   └── ...
├── README.md           # This file
└── ...
```

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.x or above
- Cloud credentials (e.g., AWS, Azure, GCP) as required by modules

### Usage

1. **Clone this repo:**
    ```sh
    git clone https://github.com/mradulnatani/multi-env-terraform-modules.git
    cd multi-env-terraform-modules
    ```

2. **Choose a module and environment:**
    - Review `modules/` for available modules.
    - Use or modify files under `environments/<env-name>/` for your environment.

3. **Initialize Terraform:**
    ```sh
    terraform init
    ```

4. **Plan and apply:**
    ```sh
    terraform plan -var-file="environments/dev/terraform.tfvars"
    terraform apply -var-file="environments/dev/terraform.tfvars"
    ```

    Replace `dev` with your environment name as needed.

### Example Usage

Suppose you want to provision a VPC using the `vpc` module for your `dev` environment:

```hcl
module "vpc" {
  source = "../../modules/vpc"
  env    = "dev"
  cidr   = "10.0.0.0/16"
  # other variables...
}
```

- Place this in `environments/dev/main.tf`
- Adjust variables as needed

## Customization

- Add new modules under `modules/`
- Create new environment configurations under `environments/`
- Reference modules in environment `main.tf` files

## Contributing

Contributions are welcome! Please open issues or pull requests for bug fixes, new modules, or improvements.

## License

This repository is [MIT Licensed](LICENSE).

## Support

If you encounter issues or have questions, please open an issue in this repo.

---

*Happy Terraforming!* 🚀
