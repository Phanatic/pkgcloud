workflow "Publish to GPR on label" {
  on = "pull_request"
  resolves = ["Comment on PR"]
}

action "Publish to GPR" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = [
    "When PR is labeled",
  ]
  secrets = [
    "GITHUB_TOKEN",
    "NPM_AUTH_TOKEN",
  ]
  args = "publish -ddd"
  env = {
    NPM_REGISTRY_URL = "npm.registry.github.com"
  }
}

action "When PR is labeled" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "label npm-gpr-publish"
}

action "Comment on PR" {
  uses = "./.github/comment"
  needs = ["Publish to GPR"]
  secrets = ["GITHUB_TOKEN"]
}
