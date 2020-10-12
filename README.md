# AWS infrastructure with Terraform

## Cloud Infrastructure
![imageofinfrastructure](https://github.com/sophiecosgrove/terraformtest/blob/autoscaling/images/Screenshot%202020-10-12%20at%2013.53.33.png)
### Autoscaling
I used the aws autoscaling service to manage the instances. This still required me to iterate over certain modules in order to deploy them in each availability zone, but resulted in simpler module structure. 
## Basic Front End
I deployed the front end using a dockerised flask app. I did this for the purpose of having compact code, so that it could be automatically run by Terraform in the public instance.
![imageoffrontend](https://github.com/sophiecosgrove/terraformtest/blob/autoscaling/images/Screenshot%202020-10-11%20at%2018.03.31.png)

## File Structure
![imageoffilestructure](https://github.com/sophiecosgrove/terraformtest/blob/autoscaling/images/Screenshot%202020-10-12%20at%2013.55.19.png)

## Commands
- terraform init
- terraform plan
- terraform apply

## Execution
![imageofplan](https://github.com/sophiecosgrove/terraformtest/blob/autoscaling/images/Screenshot%202020-10-12%20at%2013.29.59.png)

