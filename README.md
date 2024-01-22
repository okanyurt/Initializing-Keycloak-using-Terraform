# Initializing Keycloak using Terraform

This repository contains an infrastructure configured with Terraform. Follow the steps below for the setup and management of the infrastructure.

## Firstly:

After installing Terraform, start by creating a new folder. Open this folder with Visual Studio Code. Create a file named main.tf. Copy and paste the first eight lines from the file in my project into your main.tf file. Then, execute the following command.

```bash
terraform init
```
When you run this command, the specified provider will be downloaded to your local environment.
NOTE: I am providing this with the Keycloak provider. You can perform this with a different provider if you choose. This repository will serve as an example of how to use Terraform.

## Planing

Afterwards, write the script for your provider. Progress with small commands. As you write in blocks, run the following command.

```bash
terraform plan
```

This command will build the changes you plan to make. It will check for any syntax errors or the use of features that are not available in the provider. Then, it will revise the plan file.

## Apply

To apply a successful plan, you can run the following command. By executing this command, you will apply the changes in your configuration to your infrastructure.
```bash
terraform apply
```

## Security Notes

- Passwords and sensitive data are stored in the variables.tf file (optinal). Ensure this information is current and secure. It's important that it's stored in the right place. Decide on this carefully.
- Don't forget to provide sensitive data through environment variables.
