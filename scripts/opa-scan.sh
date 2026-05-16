#!/usr/bin/env bash
set -e

ENV_NAME="${1:-qa}"

opa eval \
  --format pretty \
  --data policies \
  --input build-plan/${ENV_NAME}.tfplan.json \
  "data.terraform.security.deny"
