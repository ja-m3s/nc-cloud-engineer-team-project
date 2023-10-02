#!/usr/bin/env bash
#Author: James Whitburn
#Description: Updates the .env on frontend app with the
#load balancer name.
#Run: ./update-backend-url.sh

set -x

#Retrieve load-balancer name
kubectl describe service service-3s-a-cloud-backend | 
    grep 'LoadBalancer Ingress' | 
    cut -d':' -f2 | 
    awk '{print "VITE_API_BASE_URL=http://" $1 ":8080"}' |
    tee ".env"

#Get frontend pods
FRONTEND_PODS=($(kubectl get pods -l app=3s-a-cloud-frontend -o jsonpath='{range .items[*]}{.metadata.name}{" "}{end}'))

#Update them
for POD in "${FRONTEND_PODS[@]}"; do
  kubectl cp .env ${POD}:/app/.env
done

#Tidy up temp file
rm .env