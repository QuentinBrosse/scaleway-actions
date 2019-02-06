workflow "Test" {
  on = "push"
  resolves = ["List qbtest bucket"]
}

action "List qbtest bucket" {
  uses = "quentinbrosse/scaleway-actions@master"
  secrets = ["ACCESS_KEY"]
  args = "ls s3://qbtest"
}
