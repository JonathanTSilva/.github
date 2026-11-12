# Repo anatomy

Every active repo has the same files, README structure, badge row and CI shape. New repos get all of it from `jts-ops new`, which renders the Copier template [`template-repo`](https://github.com/JonathanTSilva/template-repo). The template supports the stacks `python`, `node`, `shell` and `none`; more arrive later. Run `copier update` to re-sync a repo when the standard changes.

`template-repo` is not a GitHub template repository: the "Use this template" button would copy unrendered Jinja, so new repos are created with `jts-ops new`.

## Files

The `active` audit profile in [`standard.yml`](../standard.yml) requires these:

| File | Purpose |
|---|---|
| `README.md` | Standard structure and badge row, see below |
| `LICENSE` | Per repo, see [licensing](licensing.md) |
| `AGENTS.md` | Single source of instructions for AI agents, see [AI assistance](ai.md) |
| `CLAUDE.md` | Contains only `@AGENTS.md` |
| `.editorconfig` | Editor settings |
| `.gitignore` | Ignore rules for the stack |
| `.pre-commit-config.yaml` | Stack hooks, Conventional Commit check, gitleaks |
| `.github/workflows/ci.yml` | Calls the shared workflows, see below |
| `.github/dependabot.yml` | Ecosystem and GitHub Actions updates, grouped weekly |
| `.github/CODEOWNERS` | Review ownership |
| `.claude/settings.json` | Shared, safe Claude Code permissions |
| `.devcontainer/devcontainer.json` | Makes "Open in Codespaces" work |
| `.copier-answers.yml` | Lets `copier update` re-sync later |

Also shipped by the template: `.claude/agents/`, `.markdownlint-cli2.yaml` and the stack's project skeleton.

Community files (code of conduct, contributing, security policy, support, issue forms, PR template) come from the [`.github`](https://github.com/JonathanTSilva/.github) defaults. A repo overrides one only when it truly differs. A license cannot be a default, so it is always in the repo.

Other profiles: `archived` requires only `README.md` ([archiving](archiving.md)); `exempt` and `special` repos require nothing.

## README structure

The template enforces this order:

1. Banner or title
2. One-line description
3. Badge row
4. What it is, in 2 to 3 lines
5. Quick start
6. Usage
7. Link to docs
8. Contributing
9. License

Archived repos add the [archive banner](archiving.md) on top.

## Badge row

Shields.io badges, always `style=flat-square`, in this order, including only the ones that apply.

| # | Badge | Source |
|---|---|---|
| 1 | Status | repostatus.org |
| 2 | CI | Workflow status of `ci.yml` |
| 3 | Release | Latest GitHub Release |
| 4 | Coverage | Codecov |
| 5 | Quality | SonarQube Cloud quality gate |
| 6 | Scorecard | OpenSSF Scorecard |
| 7 | License | Repo license |
| 8 | Codespaces | "Open in Codespaces" link |

```markdown
[![Status](https://img.shields.io/badge/status-active-brightgreen?style=flat-square)](https://www.repostatus.org/#active)
[![CI](https://img.shields.io/github/actions/workflow/status/JonathanTSilva/<repo>/ci.yml?branch=main&style=flat-square&label=ci)](https://github.com/JonathanTSilva/<repo>/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/JonathanTSilva/<repo>?style=flat-square)](https://github.com/JonathanTSilva/<repo>/releases)
[![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)](LICENSE)
```

## CI

A repo's `ci.yml` is short. It picks reusable workflows from [`.github/workflows`](https://github.com/JonathanTSilva/.github/tree/main/.github/workflows), pinned to a version tag such as `@v1`. It ends with an aggregator job named `ci`, which depends on all the others. `ci` is the single required status check in the [ruleset](security.md).

| Workflow | Does | Used by |
|---|---|---|
| `pr-hygiene` | Conventional PR title, branch-name pattern | All repos |
| `lint-docs` | markdownlint, link check | All repos |
| `security` | gitleaks; dependency review and Scorecard on public repos | All repos |
| `python` | uv, ruff, pyright, pytest with coverage | Python repos |
| `node` | pnpm, eslint, typecheck, vitest | TypeScript and JavaScript repos |
| `shell` | shellcheck, shfmt, bats | Shell repos |
| `release` | release-please and provenance, see [releases](releases.md) | Released products |

Planned, not yet built: `go`, `c-cpp`, `latex`, `e2e`, `lighthouse`, `load`, `bench` and `reports`, each added when a repo needs it.

Third-party actions are pinned by full commit SHA with a `# vX.Y.Z` comment, and workflows default to read-only permissions. See [security](security.md).
