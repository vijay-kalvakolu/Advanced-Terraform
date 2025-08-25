# Terraform GCP Base Infrastructure

This Terraform project provisions a basic set of networking and compute resources on Google Cloud Platform (GCP).

## Features

*   Creates a custom VPC network.
*   Creates a subnet within the VPC.
*   Provisions a Google Compute Engine (GCE) instance with a static private IP.
*   Sets up a firewall rule to allow inbound SSH, HTTP, HTTPS, and ICMP traffic to the instance.

## Prerequisites

*   [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed.
*   [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and authenticated.
*   A Google Cloud Project with the Compute Engine API enabled.

## Setup & Usage

1.  **Clone the repository:**
    ```sh
    git clone <your-repo-url>
    cd Advanced-Terraform/base
    ```

2.  **Configure Project ID:**
    Create a `.env` file in the `base` directory. This file is listed in `.gitignore` and will not be committed to source control.
    ```bash
    # .env
    export TF_VAR_project_id="your-gcp-project-id"
    ```

3.  **Load Environment Variables:**
    Source the `.env` file to load the variables into your shell session. You must do this for every new terminal session.
    ```sh
    source .env
    ```

4.  **Initialize and Apply Terraform:**
    ```sh
    terraform init
    terraform apply
    ```

## Resources Created

| Name | Type | Description |
|---|---|---|
| `my-vpc` | VPC Network | Custom mode VPC to house all resources. |
| `my-sn` | Subnet | A `10.1.0.0/24` subnet in the `us-central1` region. |
| `obs-ce` | Compute Instance | An `e2-medium` instance running Debian 12. |
| `allow` | Firewall Rule | Allows ingress traffic for TCP ports 22, 80, 443 and ICMP. |

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `project_id` | The GCP project ID. | `string` | n/a |
| `region` | The GCP region for resources. | `string` | `us-central1` |
| `zone` | The GCP zone for the compute instance. | `string` | `us-central1-a` |
| `machine_type` | The machine type for the compute instance. | `string` | `e2-medium` |
| `image` | The OS image for the compute instance. | `string` | `debian-12` |
| `nw-ip` | The static private IP for the instance. | `string` | `10.1.0.10` |

## Outputs

| Name | Description |
|---|---|
| `instance-connect` | The private IP address of the `obs-ce` compute instance. |