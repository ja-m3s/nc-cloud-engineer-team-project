Deploying Argo to EKS: 

kubectl needs to be pointing to the right cluster, aws cli aneeds to be set to correct account, cluster needs to be up and running by this point. 

kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl get pods -n argocd // checking deplyment is successful

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d // getting the password, note somewhere 

kubectl port-forward svc/argocd-server -n argocd 8080:443 // setting up an open port to access argocd UI. ! terminal needs to stay on the open port as long as access is needed to argo UI. access on localhost:8080

configure argocd cli : (if not donfigures yet

https://argo-cd.readthedocs.io/en/stable/getting_started/


* complete list of commands: might be missing something in argocd cli config. 


kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.8.4/manifests/install.yaml

curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

argocd version

argocd --server https://CB2018B65C1168C92F87BC16E2DE4E50.gr7.eu-west-2.eks.amazonaws.com version  (did not work, might) 

aws eks --region  eu-west-2 update-kubeconfig --name project-3s-a-cloud-cluster

kubectl config get-contexts

argocd cluster add arn:aws:eks:eu-west-2:296134751514:cluster/project-3s-a-cloud-cluster --kubeconfig ~/.kube/config  (did not work, might) 

argocd context list

aws eks describe-cluster --name project-3s-a-cloud-cluster --query "cluster.endpoint"

argocd login 127.0.0.1:8080

kubectl config get-contexts -o name

argocd cluster add arn:aws:eks:eu-west-2:296134751514:cluster/project-3s-a-cloud-cluster

kubectl config set-context --current --namespace=argocd


This should successfully add the eks to argocd list of available contexts for deployment alongside the local cluster. 





or use this link!!!! to add eks to cluster list for argo:

https://blog.devgenius.io/how-to-deploy-argocd-in-eks-cluster-for-continuous-deployment-6ebbb3009024

