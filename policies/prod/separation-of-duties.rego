package env0

# METADATA
# title: separation of duties
# description: approver is not deployer 
allow[msg] {
	some i
	input.deployerUser.email != input.approvers[i].email
	msg := sprintf("Separation of Duties: Approved by: %v", [input.approvers[i].name])
}

allow[msg] {
	input.deployerUser.name == "env0"
  count(input.approvers) > 0
  msg := sprintf("Automated Deployment Approved by: %v", [input.approvers[0].name])
}

# METADATA
# title: CD Triggers
# description: if CD trigger, wait for approval. 
pending[msg] {
	input.deployerUser.name == "env0"
  count(input.approvers) == 0
	msg := "RULE 88: Wait for Approval on Automated Deployment"
}

pending[msg] {
	input.deployerUser.name == input.approvers[_].name
  	msg := "Separation of Duties: Deployer cannot also Approve the deployment"
}