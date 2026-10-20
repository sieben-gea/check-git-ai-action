## git-ai check action

This github action checks if the recent commits have been annotated using the [git-ai](usegitai.com) git extension, which is useful for enforcing a policy of annotation on your repo.

Use it in your workflow (you should checkout the code before):

```yaml
jobs:
  steps:
  - name: Checkout code
    uses: actions/checkout
    with:
        fetch-depth: 0
  - name: Check if git-ai annotations exist in the last commit
    uses: sieben-gea/check-git-ai-action
    with:
        revision-range: HEAD~1..HEAD
```

It fails, if git-ai was not used to annotate the last commit.