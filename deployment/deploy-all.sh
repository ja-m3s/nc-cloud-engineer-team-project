#!/usr/bin/env bash

#Author: James Whitburn
#Description: deploys all YAML (stop gap script to use before helm)

set -xe
#Create all app components in k8s
kubectl apply -f ../database/kubernetes/
kubectl apply -f ../backend/kubernetes/
kubectl apply -f ../frontend/kubernetes/

#wait a bit then update the frontend with the backend LB
sleep 2m
cd ../frontend/scripts/
./update-backend-url.sh