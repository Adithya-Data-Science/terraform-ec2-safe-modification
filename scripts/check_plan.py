import json, sys
plan = json.load(open(sys.argv[1], encoding="utf-8"))
changes = {c["address"]: c["change"]["actions"] for c in plan.get("resource_changes", [])}
actions = changes.get("aws_instance.lab")
if actions != ["update"]:
    raise SystemExit(f"Expected in-place update; found {actions!r}")
print("PASS: aws_instance.lab changes in place")

