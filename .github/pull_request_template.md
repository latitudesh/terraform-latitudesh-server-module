## 📋 Description

Brief description of the changes made in this pull request.

Closes #<!-- issue number if applicable -->

## 🏷️ Type of Change

Please delete options that are not relevant.

- [ ] 🐛 Bug fix (non-breaking change which fixes an issue)
- [ ] ✨ New feature (non-breaking change which adds functionality)
- [ ] 💥 Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] 📚 Documentation update
- [ ] 🔧 Refactoring (no functional changes, no api changes)
- [ ] 🎨 Style changes (formatting, missing semi colons, etc)
- [ ] 🧪 Test changes (adding missing tests, correcting existing tests)
- [ ] 🔨 Build/CI changes
- [ ] ♻️ Performance improvements

## 🧪 Testing

Please describe the tests that you ran to verify your changes. Provide instructions so we can reproduce.

- [ ] I have tested these changes locally
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] I have run `terraform fmt` to format the code
- [ ] I have run `terraform validate` to validate the configuration
- [ ] I have run `make lint` to check code quality
- [ ] I have run `make security` to check for security issues

## 📝 Examples Tested

Which examples have you tested with these changes?

- [ ] `simple-server`
- [ ] `server-with-provisioner-inline`
- [ ] `server-with-provisioner-local-exec`
- [ ] `server-with-provisioner-script`
- [ ] `server-with-provisioner-scripts`
- [ ] `server-with-multiple-provisioners`

## 📖 Documentation

- [ ] I have updated the README.md if necessary
- [ ] I have updated variable descriptions if necessary
- [ ] I have updated output descriptions if necessary
- [ ] I have added/updated examples if necessary
- [ ] I have updated the CHANGELOG.md (if applicable)

## ✅ Checklist

- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
- [ ] Any dependent changes have been merged and published in downstream modules

## 🔄 Breaking Changes

If this PR introduces breaking changes, please describe:

1. **What breaks:** What existing functionality is affected?
2. **Migration path:** How should users update their code?
3. **Deprecation timeline:** When will the old functionality be removed?

Example:
```hcl
# Before (deprecated)
billing_type = "hourly"

# After (new)
billing = "hourly"
```

## 📊 Impact

- **Backward compatibility:** Yes/No
- **Performance impact:** None/Positive/Negative
- **Resource changes:** None/Add/Modify/Remove

## 🔍 Review Focus Areas

Please pay special attention to:

- [ ] Security implications
- [ ] Performance impact
- [ ] Breaking changes
- [ ] Error handling
- [ ] Documentation accuracy

## 📷 Screenshots (if applicable)

Add screenshots to help explain your changes.

## 🔗 Related Issues/PRs

- Related to #<!-- issue number -->
- Depends on #<!-- PR number -->
- Blocks #<!-- issue number -->

## 🧾 Additional Notes

Add any other notes about the pull request here.

---

**By submitting this pull request, I confirm that:**
- [ ] I have read and agree to the project's contributing guidelines
- [ ] My contribution is licensed under the same license as this project
- [ ] I understand that this contribution becomes part of the project