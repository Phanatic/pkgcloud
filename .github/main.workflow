workflow "Publish to GPR on label" {
  on = "pull_request"
  resolves = ["Publish to GPR"]
}

action "Publish to GPR" {
  uses = "./.github/npm"
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
