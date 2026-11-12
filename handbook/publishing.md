# Publishing

Some tools start as a work demand. Whether one can be public depends on who owns the code.

**Company-owned code stays private.** If an employer or client owns it, the repo is private, keeps the company's license, and is archived when the work ends. Only a tool Jonathan owns may be published, even if work prompted it.

## Sanitize checklist

Before a private repo becomes public, every box is checked and Jonathan signs off.

- [ ] Ownership confirmed: Jonathan owns the code, not an employer or client
- [ ] Client and company names removed from code, docs, tests and commit messages
- [ ] Internal hostnames, IP addresses, URLs and paths removed
- [ ] Real data replaced with invented fixtures
- [ ] Credentials, tokens and keys removed and rotated
- [ ] gitleaks run over the full history with no findings
- [ ] If history is unsafe, publish a fresh squashed history instead
- [ ] Issues, pull requests and wiki reviewed for the same leaks
- [ ] License chosen (see [licensing](licensing.md))
- [ ] The repo meets the [repo anatomy](repo-anatomy.md) before visibility changes

## Order of work

1. Sanitize in the private repo and review the result.
2. Run the checklist and get sign-off.
3. Change visibility. This is an irreversible action, so it goes on the reviewed list described in [AI assistance](ai.md).
4. Turn on rulesets and public-only scanning (see [security](security.md)).

## Tracking

Public repos are listed in [`inventory.yml`](../inventory.yml). Private repos are tracked in a private file kept outside every public repo.
