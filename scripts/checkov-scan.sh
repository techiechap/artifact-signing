#!/usr/bin/env bash
set -e

ENV_NAME="${1:-qa}"


# DEMO/LAB MODE:
# Non-blocking Checkov execution.
# Even if Checkov finds violations, pipeline continues.
#
# To revert back to strict/blocking mode:
# Remove '|| true' from the commands below.
#
# STRICT MODE EXAMPLE:
# checkov -d env/${ENV_NAME}
# checkov -f build-plan/${ENV_NAME}.tfplan.json

echo "Running Checkov static scan for env/${ENV_NAME}..."
checkov -d env/${ENV_NAME} || true

echo "Running Checkov plan scan for build-plan/${ENV_NAME}.tfplan.json..."
checkov -f build-plan/${ENV_NAME}.tfplan.json || true

echo "Checkov completed in non-blocking demo mode."