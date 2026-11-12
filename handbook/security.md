# Security

## Reporting

Every repo has a [security policy](https://github.com/JonathanTSilva/.github/blob/main/SECURITY.md) and private vulnerability reporting turned on. Vulnerabilities are never reported in public issues.

## What is turned on

| Control | Policy |
|---|---|
| Dependabot | Alerts and security updates on, plus a weekly grouped update for the stack and GitHub Actions |
| Secret scanning and push protection | On for public repos (GitHub native) |
| gitleaks | In pre-commit and in CI, so private repos are covered too |
| CodeQL | Default setup, where the language is supported |
| Dependency review | On pull requests of public repos |
| OpenSSF Scorecard | Workflow and badge on public repos |
| Provenance | Release artifacts are attested, see [releases](releases.md) |

## Rulesets

The account is on GitHub Free, so rulesets apply to **public repos only**. On `main` they:

- block force-push and deletion,
- require a pull request (0 required approvals, since this is a solo setup),
- require the status check `ci`,
- require linear history.

`ci` is the aggregator job at the end of every repo's `ci.yml` (see [repo anatomy](repo-anatomy.md)). A ruleset is enabled only once a repo has a `ci.yml`; before that the required check could never pass. Private repos run the same checks in CI and rely on habit for the rest.

## Workflows

- Every third-party action is pinned by full commit SHA with a `# vX.Y.Z` comment.
- Workflows default to `permissions: read-all` (or `contents: read`) and widen per job.
- Workflows are linted with actionlint and audited with zizmor.

## Repo settings

Squash-merge only, head branches deleted after merge, wikis off. These are applied by `jts-ops apply`, which is a dry run unless `--execute` is passed.
