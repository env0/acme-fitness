#####
# filename: instance-family.rego
# purpose: restrict the instance type (only AMD based) processors allowed
# note: any instance with the following prefixes : t3a
#####

package env0

format(meta) := meta.description

## STATIC VARIABLES

# METADATA
# title: require approval on improper instance type
# description: require approval from anyone
deny[message] {
  not startswith(input.plan.variables.instance_type.value, "t3a")
  count(input.approvers) == 0
  message := sprintf("EC2 RULE 1: instance family is not of t3a, instance desired: %v", [input.plan.variables.instance_type.value])
}

warn[message] {
  endswith(input.plan.variables.instance_type.value, "large")
  message := "EC2 RULE 2: warning: deploying large instance"
}

# METADATA
# title: Allow is policy is not in infringment 
# description: not violating instance family policy.
allow[format(rego.metadata.rule())] {
  true
}
