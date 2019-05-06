workflow "Publish to GPR on label" {
  on = "pull_request"
  resolves = ["Auto-merge my pull requests"]
}

action "Publish to GPR" {
  uses = "./.github/npm"
  needs = [
    "When label is gpr-npm-publish",
  ]
  secrets = [
    "GITHUB_TOKEN",
  ]
  args = "publish -ddd"
  env = {
    NPM_REGISTRY_URL = "npm.registry.github.com"
  }
}

action "When label is gpr-npm-publish" {
  needs = ["When PR is labeled"]
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "label npm-gpr-publish"
}

action "Comment on PR" {
  uses = "./.github/comment"
  needs = ["Publish to GPR"]
  secrets = ["GITHUB_TOKEN"]
}

action "When PR is labeled" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  runs = "action"
  args = "labeled"
}

action "Auto-merge my pull requests" {
  uses = "./.github/merge"
  needs = ["Comment on PR"]
  secrets = ["GITHUB_TOKEN"]
}
