#!/usr/bin/env bash
# Author: James Whitburn
# Run: chmod u+x script.sh; ./script.sh
# Desc: configures the infrastructure for project 
set -eux

terraform -chdir="./backend" init -input=false
terraform -chdir="./backend" apply -input=false -auto-approve  
sleep 60
terraform -chdir="./" init -input=false
terraform -chdir="./" apply -input=false -auto-approve 
