# DKR command: Terraform

This is [terraform](https://www.terraform.io/) command for 
[dkr](https://github.com/hekonsek/dkr).

## Packages

- `terraform`
- `helm` (required by Helm Terraform Helm module)
- `kubectl` (required by `helm`)
- `aws-iam-authenticator` (required by `kubectl` AWS authentication)
- `aws` cli v2 (required by Terraform AWS EKS module and `aws-iam-authenticator`)  

## License

This project is distributed under [Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html).