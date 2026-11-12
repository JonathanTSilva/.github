# Branches and commits

## GitHub Flow

`main` is the only long-lived branch and is always releasable. Every change is a short-lived branch, a pull request and a squash merge.

1. Open or pick an issue, so the work has a number.
2. Branch from `main` as `<type>/<issue>-<slug>`.
3. Open a pull request with a Conventional Commit title.
4. CI goes green, squash-merge, the branch is deleted.

## Branch names

`<type>/<issue>-<slug>`, for example `feat/42-tui-search`.

| Type | Use for |
|---|---|
| `feat` | A new capability |
| `fix` | A bug fix |
| `docs` | Documentation only |
| `refactor` | A change that neither fixes a bug nor adds a feature |
| `test` | Adding or fixing tests |
| `ci` | CI and automation |
| `chore` | Maintenance with no user-facing change |
| `perf` | Performance |
| `build` | Build system and dependencies |

Also allowed: `main`, `release/<major>.x` (maintenance branch for older supported versions of a product), and the bot branches `dependabot/...` and `release-please--...`. The `pr-hygiene` workflow checks the pattern on every pull request.

## Commits and PR titles

[Conventional Commits](https://www.conventionalcommits.org): `<type>: <summary>` or `<type>(<scope>): <summary>`, with the same types as branches. Examples: `fix: handle empty input`, `feat(cli): add --json flag`. Breaking changes add `!` (`feat!: drop Python 3.11`) and a `BREAKING CHANGE:` footer.

A pre-commit hook checks commit messages locally, and `pr-hygiene` checks the PR title in CI.

## Merging

Squash-merge only, so the PR title becomes the one commit on `main`. Head branches are deleted after merge. Rulesets that enforce this are described in [security](security.md).
