# Object Storage Action

Wraps the [s3cmd](https://s3tools.org) CLI to enable common [Scaleway Object Storage](https://www.scaleway.com/object-storage/) actions.

## Usage

An example workflow to build something and push it on object storage:

```hcl
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
```

This action just wraps the `s3cmd` CLI to interact with your buckets. Please refer to the [`s3cmd` usage](https://s3tools.org/usage) for more information.

### Secrets

- `SCW_ACCESS_KEY` - **Required**. Your Scaleway access key ([more info](https://www.scaleway.com/docs/generate-an-api-token))
- `SCW_SECRET_KEY` - **Required**. Your Scaleway secret key ([more info](https://www.scaleway.com/docs/generate-an-api-token))

### Environment Variables

- `REGION` - `fr-par` or `nl-ams` (`fr-par` is the default value)
