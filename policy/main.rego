package main

valid_instance_types = {"t3.micro"}

deny[msg] {
  aws_instance_creates := [ resource |
      resource := input.resource_changes[_]
      resource.type == "aws_instance"
      resource.change.actions[_] == "create"
  ]
  bad_creates := [ resource |
      resource := aws_instance_creates[_]
      not valid_instance_types[resource.change.after.instance_type]
  ]
  count(bad_creates) > 0
  msg := sprintf("Creating instances with invalid instance type: %v", [bad_creates[_].address])
}
