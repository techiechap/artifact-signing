#!/usr/bin/env bash
set -e

ENV_NAME="${1:-qa}"
PLAN_FILE="build-plan/${ENV_NAME}.tfplan"

gpg --local-user "Ashish Dhawale (Edge Engineering)" \
  --armor \
  --detach-sign \
  "${PLAN_FILE}"

echo "Signed artifact: ${PLAN_FILE}.asc"
