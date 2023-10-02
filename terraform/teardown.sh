#!/usr/bin/env bash
# Author: James Whitburn
# Run: chmod u+x script.sh; ./script.sh
# Desc: destroys the project
set -eux

terraform -chdir="./" apply -destroy -input=false -auto-approve -lock=false
sleep 60
terraform -chdir="./backend" apply -destroy  -input=false -auto-approve -lock=false
