# AWS infrastructure with Terraform

## Cloud Infrastructure
![imageofinfrastructure](https://github.com/sophiecosgrove/terraformtest/blob/master/images/Screenshot%202020-10-11%20at%2022.16.20.png)
### Availability Zone Scaling
I have decided to incorporate a 'deployment' module, consisting of 3 child modules; SUBNETS (containing public and private subnets and instances), NAT (NAT Gateway for each public subnet) and RT (route tables for public and private subnets). The code in the parent module iterates through the deployment module, deploying the infrastructure across each availability zone. 
### Load Balancing
In order to implement the load balancer, cd into the ELB directory and execute terraform apply after executing terraform in the parent directory. This module is dependent on the rest of the infrastructure already being deployed. 
## Basic Front End
I deployed the front end using a dockerised flask app. I did this for the purpose of having compact code, so that it could be automatically run by Terraform in the public instance.
![imageoffrontend](https://github.com/sophiecosgrove/terraformtest/blob/master/images/Screenshot%202020-10-11%20at%2018.03.31.png)

## File Structure
![imageoffilestructure](https://github.com/sophiecosgrove/terraformtest/blob/master/images/Screenshot%202020-10-11%20at%2023.06.00.png)

## Commands
- terraform init
- terraform plan
- terraform apply

## Execution
![imageofplan](https://github.com/sophiecosgrove/terraformtest/blob/master/images/Screenshot%202020-10-11%20at%2023.13.09.png)

