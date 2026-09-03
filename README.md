# Terraform EC2 Safe Modification Lab

This lab demonstrates how to inspect Terraform's execution plan before changing a running EC2 instance. The safe exercise changes tags and enables detailed monitoring - attributes AWS can update in place - while a comparison exercise shows a replacement-triggering AMI change without applying it.

## Workflow

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and set an allowed instance type.
2. Run `terraform init`, `terraform fmt -check`, `terraform validate`, and `terraform plan -out baseline.tfplan`.
3. Apply the baseline and inspect it with `terraform state show aws_instance.lab`.
4. Set `environment = "Classroom-Updated"` and `monitoring = true`.
5. Run `terraform plan -out update.tfplan`. Confirm the resource line begins with `~`, not `-/+`.
6. Apply, inspect state again, and run `terraform destroy` when finished.

The lab never commits credentials, state, plan files, or private keys. AWS charges may apply.

## Claim verification

`scripts/check_plan.py update.json` rejects a plan unless `aws_instance.lab` has the action `update` and no create/delete action. Produce JSON with `terraform show -json update.tfplan > update.json`.

