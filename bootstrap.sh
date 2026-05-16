#!/usr/bin/env bash
set -e

mkdir -p environments backends policies scripts .github/workflows harness docs

touch \
  providers.tf \
  main.tf \
  variables.tf \
  outputs.tf \
  environments/qa.tfvars \
  environments/stage.tfvars \
  environments/prod.tfvars \
  backends/qa.hcl \
  backends/stage.hcl \
  backends/prod.hcl \
  policies/storage.rego \
  scripts/terraform-plan.sh \
  scripts/checkov-scan.sh \
  scripts/opa-scan.sh \
  scripts/sign-artifact.sh \
  .github/workflows/iac-security.yml \
  harness/pipeline-notes.md \
  docs/interview-story.md \
  README.md \
  Makefile

chmod +x scripts/*.sh

echo "Repo skeleton created."
tree -a -I ".git"
