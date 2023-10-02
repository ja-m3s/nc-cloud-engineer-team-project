#!/usr/bin/env bash

#Author: James Whitburn
#Description: builds all apps (stop gap script to use before circleci)

set -xe

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/t6j2d9a4

#Build all app components in k8s
cd ../frontend
docker build -t 3s-a-cloud/frontend .
docker tag 3s-a-cloud/frontend:latest public.ecr.aws/t6j2d9a4/3s-a-cloud/frontend:latest
docker push public.ecr.aws/t6j2d9a4/3s-a-cloud/frontend:latest

cd ../backend
export JAVA_HOME="/usr/lib/jvm/java-1.17.0-openjdk-amd64"
docker build -t 3s-a-cloud/backend .
docker tag 3s-a-cloud/backend:latest public.ecr.aws/t6j2d9a4/3s-a-cloud/backend:latest
docker push public.ecr.aws/t6j2d9a4/3s-a-cloud/backend:latest

cd ../database
docker build -t 3s-a-cloud/database .
docker tag 3s-a-cloud/database:latest public.ecr.aws/t6j2d9a4/3s-a-cloud/database:latest
docker push public.ecr.aws/t6j2d9a4/3s-a-cloud/database:latest