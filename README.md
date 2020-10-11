# AWS infrastructure with Terraform

## Cloud Infrastructure
![imageofinfrastructure](https://github.com/sophiecosgrove/terraformtest/blob/master/images/Screenshot%202020-10-11%20at%2022.16.20.png)

## Basic Front End
I deployed the front end using a dockerised flask app. I did this for the purpose of having compact code, so that it could be automatically run by Terraform in the public instance.
![imageoffrontend](https://github.com/sophiecosgrove/terraformtest/blob/master/images/Screenshot%202020-10-11%20at%2018.03.31.png)

## File Structure
.
├── deployment
│   ├── main.tf
│   ├── NAT
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── outputs.tf
│   ├── RT
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── SUBNETS
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── variables.tf
├── ELB
│   ├── main.tf
│   └── variables.tf
├── images
│   ├── Screenshot\ 2020-10-11\ at\ 18.03.31.png
│   └── Screenshot\ 2020-10-11\ at\ 22.16.20.png
├── main.tf
├── networking
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
├── README.md
├── terraform_plan.txt
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf

7 directories, 25 files
