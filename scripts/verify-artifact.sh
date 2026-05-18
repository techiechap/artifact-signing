#!/usr/bin/env bash
set -e

ENV_NAME="${1:-qa}"
PLAN_FILE="build-plan/${ENV_NAME}.tfplan"
SIG_FILE="${PLAN_FILE}.asc"

gpg --import keys/quantedge-gpg-public.asc

gpg --verify "${SIG_FILE}" "${PLAN_FILE}"

echo "Signature verified for ${PLAN_FILE}"
