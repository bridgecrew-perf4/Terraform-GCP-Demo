# Terraform "GCP EXAMPLE NGINX SERVER"

This folder contains a simple Terraform module that deploys resources in GCP for a web server


# Running this module manually
1. Sign up/in for [GCP](https://cloud.google.com/).
2. Create a new Google Cloud Project
3. Create [service account key](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
4. Select JSON as the key type and click **Create**.  
-Notes: If you are creating a new service account for this demo, you can use  the Project Owner, however it recommended that the service account is then removed -or restricted scope after the demo has been completed.
5. Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/gcp-get-started)
6. Create a directory for the new configuration
    ```
    mkdir terraform-gcp-instance-nginx
    cd terraform-gcp-instance-nginx
    git clone https://github.com/divergent-rose/Terraform-GCP-Demo.git
    cd Terraform_Demo
    ```
7. Upload JSON file to the project directory for this demo. However, for production projects this should be stored in a secure place.   
8. Run vim main.tf to set the project ID from the second step to the `'project'` property. 
9.  Run terraform init.
10. Run terraform fmt.
11. Run terraform apply.
12. Once the instance is running, go to your GCP console and look up the Compute Enginer information for the instances IP address. 
13. Open a browser and navigate to the site. 
14. When you're done, run terraform destroy.
