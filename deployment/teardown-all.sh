#!/usr/bin/env bash

#Author: James Whitburn
#Description: destroys all YAML (stop gap script to use before helm)

set -x
#Create all app components in k8s
kubectl delete -f ../database/kubernetes/
kubectl delete -f ../backend/kubernetes/
kubectl delete -f ../frontend/kubernetes/