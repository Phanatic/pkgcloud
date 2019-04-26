workflow "Publish to GPR on push" {
  on = "push"
  resolves = ["GitHub Action for npm"]
}

action "GitHub Action for npm" {
  uses = "./.github/npm"
  secrets = ["GITHUB_TOKEN"]
  args = "publish -ddd"
  env = {
    NPM_REGISTRY_URL = "npm.registry.github.com"
  }
}
