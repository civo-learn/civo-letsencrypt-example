# Project Name: CIVO Letsencrypt Example

## Introduction

Example deployment of Letsencrypt on CIVO.

## Prerequisites

Before you begin, ensure you have the following:

- A [Civo Cloud account](https://dashboard.civo.com/signup).
- A [Civo Cloud API Key](https://dashboard.civo.com/security).
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed on your local machine.

## Running locally...

## Project Setup

1. Obtain your Civo API key from the Civo Cloud dashboard.
2. Create a file named `terraform.tfvars` in the project's root directory.
3. Insert your Civo API key, domain and reserved IP into this file as follows:

    ```hcl
    civo_token = "YOUR_API_KEY"
    domain = "YOUR DOMAIN"
    frontend_reserved_ip = "RESERVED IP"
    ```

