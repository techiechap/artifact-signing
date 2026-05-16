#!/usr/bin/env bash
set -e

ENV_NAME="${1:-qa}"

checkov -d env/${ENV_NAME}
checkov -f build-plan/${ENV_NAME}.tfplan.json
