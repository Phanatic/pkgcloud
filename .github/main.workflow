workflow "Publish to GPR on push" {
  on = "push"
  resolves = ["GitHub Action for npm"]
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  secrets = ["GITHUB_TOKEN"]
  args = "publish"
  env = {
    NPM_AUTH_TOKEN = "$GITHUB_TOKEN"
    NPM_REGISTRY_URL = "https://npm.registry.github.com"
  }
}
