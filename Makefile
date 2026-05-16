ENV ?= qa

.PHONY: init fmt validate plan plan-json scan-checkov scan-opa full-plan apply destroy

init:
	cd env/$(ENV) && terraform init -backend-config=backend.hcl

fmt:
	terraform fmt -recursive

validate:
	cd env/$(ENV) && terraform validate

plan:
	mkdir -p build-plan
	cd env/$(ENV) && terraform plan -out ../../build-plan/$(ENV).tfplan

plan-json:
	cd env/$(ENV) && terraform show -json ../../build-plan/$(ENV).tfplan > ../../build-plan/$(ENV).tfplan.json

scan-checkov:
	./scripts/checkov-scan.sh $(ENV)

scan-opa:
	./scripts/opa-scan.sh $(ENV)

full-plan: fmt init validate plan plan-json scan-checkov scan-opa

apply:
	cd env/$(ENV) && terraform apply ../../build-plan/$(ENV).tfplan

destroy:
	cd env/$(ENV) && terraform destroy -auto-approve
