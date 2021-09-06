# Blog

- This repo contains all of the IaC for my blog and the automation I have added to it. 

## Technologies 

- Terraform 
- Azure
- Wordpress
- MySQL

## Set Up 
- I have used remote storage for my terraform state, this can be set up following this: [Guide](https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=powershell).
- I have used a .tfvars file that is not commited however the variables in this file are: 
    - subscription_id
    - prefix
    - location

## Deployment
