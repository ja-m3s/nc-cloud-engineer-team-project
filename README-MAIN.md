# Welcome to our Team Project! 

## We are called 3s-a-cloud. We are super excited to tackle this challenge, the biggest so far, and to grow immensely along the way. Inside this README you will find a documentation of our journey so that it is easy to follow, fun and informative! Please try this at home. 

### Without further ado, let's start! 

# 1. Create file structure 

### Create the following directories into your project: 

* backend, frontend and database directories to contain source code and kubernetes folders 
* helm directory for the helm chart
* tests directory to contain the Test Plan files and Integration Testing files
* README file to document all the steps
* project_overview contains an intro provided by the NC, and github links to original backend and frontend repositories 

# 2. Set up AWS access for all the team members

Team AWS accounts created and details shared with team, kubectl access to k8s granted via terraform config map

# 3. Set up ECR and EKS on AWS 

EKS is deployed via terraform.

# 4. Review frontend source code, any additions

## To spin up the application on your local machine, navigate to the frontend directory and run 
```
npm install
```

followed by:

```
npm start
```

when signed in: 

/signup

/dashboard

/dashboard/customers : all users

# 5. Review Backend source code, any additions

To be able to run the backend on your local machine, you need to have Java and Maven installed. If you haven't here are some instructions to install on a Ubuntu machine: 

```sudo apt update
sudo apt install openjdk-17-jdk  # This installs OpenJDK 17, but you can replace 17 with the desired version.
```
```
sudo apt update
sudo apt install maven
```
```
java -version
```
```
mvn -version
```
The backend source code is spinning up a java application. Please note the following: 

* The available endpoints are : 

localhost:8080/info

localhost:8080/actuator/health

localhost:8080/actuator/prometheus

api/v1/auth

and the backend is running on port 8080. 

At the moment the built-in database is at 5433/testdb2. 

### 

# 6. Review Database code, any additions

# Set up a database 

### The built-in database is spun up and destroyed together with the backend container, so adding a database that can retain data between deployments is necessary. 

# 7.a Create Kubernetes to deploy the app into EKS

## When creating .yaml files, observe these port mappings : 

### * Frontend pod on port 80
### * Frontend Service on port 5173, LoadBalancer 
### * Backend pod on port 8080
### * Backend Service on port 8080. LoadBalancer
### * Database pod on port 5432
### * Database Service 5432 ! ClusterIp! 

## Kubernetes Secret to store the database credentials



# 7.b Compile Kubernetes files into a Helm chart 

# 7.c Set up a Helm chart

### To create a Helm chart, navigate to the root level of the directory and run 

```
helm create <name of helm chart>
```
This will create the entire Helm chart structure, and you can then go ahead and delete the files you don't need fro your project. we have only kept the templates folder with deployment.yaml, service.yaml and secret.yaml, the Chart.yaml and the values.yaml. 


Combine the deployments into the deployment.yaml, make sure toseparate them with --- , compile the services in the same way and use the values.yaml file to assign values dynamically. 

# 8. Set up Argo for automated deployment of the Helm chart : 

### Installing ArgoCD


To do this firstly create a separate [Kubernetes namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) for ArgoCD

```
kubectl create namespace argocd
```
Then apply the YAML files associated with Argo:

```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

You can see if your ArgoCD pods deployed by running:

```
kubectl get pods -n argocd
```
### Obtaining the ArgoCD password

To log in to the ArgoCD user interface you will need to obtain the password.

Run the following command to obtain your admin password, once **all** of your pods are ready and running:
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### Port forwarding to access ArgoCD

```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
! If you already have something on port 8080, use 8081 or any similar. 

### Logging into ArgoCD

Open up your browser and navigate to [http://localhost:8080](http://localhost:8080)

Your browser will warn you about the certificate, choose Advanced and **Proceed anyway**

You should then see the ArgoCD log in page

username **admin**

Enter the password received in the previous step and log in

### Setting up your repository

For Argo to have access to your repository you should use a GitHub access token during configuration. 

# CircleCI

Builds are configured to re-run on changes to main branch.

The workflow and jobs are stored in .circleci/config.yml

Currently, all components of the application are rebuilt on changes to main.

In future, it would be worth refactoring to only apply builds conditionally based on folder changes.

# Integration testing 


