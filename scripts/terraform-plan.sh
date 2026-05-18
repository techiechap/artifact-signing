#!/usr/bin/env bash
set -e

ENV_NAME="${1:-qa}"

mkdir -p build-plan

cd env/${ENV_NAME}

terraform init -backend-config=backend.hcl
terraform validate
terraform plan -out ../../build-plan/${ENV_NAME}.tfplan
terraform show -json ../../build-plan/${ENV_NAME}.tfplan > ../../build-plan/${ENV_NAME}.tfplan.json