workflow "Build" {
  on = "push"
  resolves = ["upload_the_build"]
}

action "build_something" {
  uses = "docker://alpine:3.8"
  runs = ["sh", "-c", "echo 'I am the build' > ${GITHUB_SHA}.build"]
}

action "upload_the_build" {
  needs = "build_something"
  uses = "quentinbrosse/scaleway-actions/object-storage@master"
  secrets = ["SCW_ACCESS_KEY", "SCW_SECRET_KEY"]
  args = "put ${GITHUB_SHA}.build s3://qbtest"
}
