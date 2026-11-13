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
| `go` | gofmt, go vet, go test with the race detector and coverage | Go repos |
| `rust` | rustfmt, clippy, cargo test | Rust repos |
| `c-cpp` | CMake build, ctest, clang-tidy, cppcheck | C and C++ repos |
| `latex` | latexmk, the PDF uploaded as an artifact | LaTeX repos |
| `shell` | shellcheck, shfmt, bats | Shell repos |
| `release` | release-please and provenance, see [releases](releases.md) | Released products |

Opt-in workflows, each added to `ci.yml` only when a repo wants it:

| Workflow | Does | Needs |
|---|---|---|
| `coverage` | Uploads a coverage artifact to Codecov through OIDC, public repos only, never fails CI | Call it after `python`, `node` or `go` with `needs:` and the artifact name |
| `sonar` | SonarQube Cloud scan, public repos only | The `SONAR_TOKEN` secret, otherwise it is skipped with a notice |
| `e2e` | Playwright with browsers installed, the HTML report uploaded | A pnpm project with `@playwright/test` |
| `lighthouse` | Lighthouse CI against a static build or a started server, with a budget file | `static-dist-dir`, `urls` or a `lighthouserc` file |
| `load` | k6 against a server started from a command, with thresholds as input | A k6 script, default `tests/load/main.js` |
| `bench` | Benchmarks compared with the history on `gh-pages`, alert on a regression | A `gh-pages` branch for the history |
| `reports` | Allure report published to `gh-pages` under `/reports/` | An Allure results artifact and a `gh-pages` branch |

### Coverage

`python` and `go` always upload their coverage file as an artifact (`coverage` and `go-coverage`). `node` does it when called with `coverage: true`, from a `coverage` script that writes `coverage/lcov.info` (artifact `node-coverage`). None of them talks to Codecov, so their permissions did not change. To send the file to Codecov, add a `coverage` job:

```yaml
  coverage:
    needs: python
    permissions:
      actions: read
      contents: read
      id-token: write
    uses: JonathanTSilva/.github/.github/workflows/coverage.yml@v1
    with:
      artifact: coverage
      flags: python
```

The upload runs only on public repos, uses OIDC (no token secret) and has `fail_ci_if_error: false`, so a Codecov outage never turns `ci` red.

### Permissions a caller must grant

A reusable workflow cannot hold more permissions than the calling job grants, and GitHub checks this statically before the run starts. A workflow that asks for a new permission therefore breaks every caller that does not grant it, even when the step is skipped. Existing workflows never widen what they request. New permissions only come with a new opt-in workflow.

#### v1.0 caller grants

These are the grants callers had at `v1.0`. The `validate` workflow fails when `python`, `node`, `shell`, `lint-docs` or `pr-hygiene` requests more than this table.

| Workflow | Permissions the calling job grants |
|---|---|
| `python`, `node`, `shell`, `lint-docs` | `contents: read` |
| `pr-hygiene` | `pull-requests: read` |
| `security` | `actions: read`, `contents: read`, `id-token: write`, `pull-requests: read`, `security-events: write` |
| `release` | `contents: write`, `issues: write`, `pull-requests: write`, `id-token: write`, `attestations: write` |

#### Added since v1.0

| Workflow | Permissions the calling job grants |
|---|---|
| `go`, `rust`, `c-cpp`, `latex` | `contents: read` |
| `sonar`, `e2e`, `lighthouse`, `load` | `contents: read` |
| `coverage` | `actions: read`, `contents: read`, `id-token: write` |
| `bench`, `reports` | `contents: write` (pushes to `gh-pages`) |

```yaml
jobs:
  python:
    permissions:
      contents: read
    uses: JonathanTSilva/.github/.github/workflows/python.yml@v1
```

### Pages-dependent steps

`bench` and `reports` keep their output on the `gh-pages` branch. Create it once per repo (an orphan branch with an empty commit) and set Pages to deploy from it. Without the branch they still run the benchmarks or build the report, upload the result as an artifact and skip publishing with a warning. A failed push is a warning too, never a red `ci`.

Third-party actions are pinned by full commit SHA with a `# vX.Y.Z` comment, and workflows default to read-only permissions. See [security](security.md).
