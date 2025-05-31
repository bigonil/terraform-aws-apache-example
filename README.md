# terraform-aws-apache-example

Terraform module for deploying Apache HTTP Server on AWS.

## Usage

```hcl
module "apache" {
  source  = "github.com/<your-username>/terraform-aws-apache-example"
  vpc_id = "<your-vpc-id>"
  public_key = "<your-ssh-public-key>"
  my_ip_with_cidr = "<your-ip>/32"
  instance_type = "t2.micro"
  server_name = "My Apache Server"
  aws_region = "us-east-1" # or your preferred region
}
```

## Variables

See the `variables.tf` file for the full list of configurable variables, including:

- `vpc_id`: The ID of the VPC where the instance will be launched (required)
- `public_key`: SSH public key for EC2 access (required)
- `my_ip_with_cidr`: Your IP with CIDR for SSH (required)
- `instance_type`: EC2 instance type (default: t2.micro)
- `server_name`: Name tag for the EC2 instance (required)
- `aws_region`: AWS region to deploy resources (default: us-east-1)

## Outputs

See the `outputs.tf` file for the full list of available outputs.

## Example usage

```hcl
module "apache" {
  source = "github.com/<your-username>/terraform-aws-apache-example"
  vpc_id = "vpc-xxxxxxx"
  public_key = "ssh-rsa AAAA..."
  my_ip_with_cidr = "1.2.3.4/32"
  instance_type = "t2.micro"
  server_name = "Test Apache Server"
  aws_region = "us-east-1"
}
```

## Requirements

- Terraform >= 1.0.0
- AWS Provider >= 3.0
- AWS credentials configured (profile `lb-aws-admin` will be used by default)

## Provider

This module uses the following provider block:

```hcl
provider "aws" {
  region  = var.aws_region
  profile = "lb-aws-admin"
}
```

## License

This module is licensed under the Apache 2.0 License. See the LICENSE file for details.

---

> Publish this module on the Terraform Registry following the [official guide](https://developer.hashicorp.com/terraform/registry/modules/publishing).
