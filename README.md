# Terraform "GCP EXAMPLE NGINX SERVER"

This folder contains a simple Terraform module that deploys resources in GCP for a web server


# Running this module manually
Prequisites: locally installed [terraform](https://www.terraform.io/intro/getting-started/install.html) and [SSH keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

1. Sign up/in for [GCP](https://cloud.google.com/).
2. Create a new Google Cloud Project
3. Create [service account key](https://console.cloud.google.com/apis/credentials/serviceaccountkey) and name the downloaded JSON *credentials*
4. Select JSON as the key type and click **Create**.  
`Notes: If you are creating a new service account for this demo, you can use  the Project Owner, however it recommended that the service account is then removed -or restricted scope after the demo has been completed.`
5. Create a directory for the new configuration
    ```
    git clone https://github.com/divergent-rose/Terraform-GCP-Demo.git
    cd Terraform-GCP-Demo
    ```
6. Upload credentials.JSON file to the project directory for this demo. 
```
sudo mv credentials.json /TerraForm-GCP-Demo
```
7. Run vim main.tf to set the project ID from the second step to the `'project'` property.  
8.  Run terraform init.
9. Run terraform fmt.
10. Run terraform apply.
11. Once the instance is running, go to your GCP console and look up the Compute Enginer information for the instances IP address. 
12. Open a browser and navigate to the site. 
13. When you're done, run terraform destroy.
