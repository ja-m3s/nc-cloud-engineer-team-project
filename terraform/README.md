To get an EKS cluster in AWS:

1. Run terraform init, then terraform apply in backend folder.
2. Wait 2mins.
3. Then, run terraform apply in main terraform folder.

OR run configure-env.sh from the terraform folder.

Take a note of the cluster endpoint name and share with the team in Slack.

Teardown:

Run teardown-all-linux.sh from the terraform folder.

To access the EKS cluster programmatically, run the following to configure your 
environment: 

aws eks --region  eu-west-2 update-kubeconfig --name project-3s-a-cloud-cluster