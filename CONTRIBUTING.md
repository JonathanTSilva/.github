# Contributing

Thanks for helping. The short version is below; the full rules live in the [handbook](https://github.com/JonathanTSilva/.github/blob/main/handbook/README.md).

## Workflow

1. Open or pick an issue first, so the work has a number to reference.
2. Branch from `main` as `<type>/<issue>-<slug>`, for example `feat/42-tui-search`. Types: `feat fix docs refactor test ci chore perf build`. Older supported versions use `release/<major>.x`. See [branches and commits](https://github.com/JonathanTSilva/.github/blob/main/handbook/branches-and-commits.md).
3. Write commits and the PR title as [Conventional Commits](https://www.conventionalcommits.org), for example `fix: handle empty input`.
4. Open a pull request using the template. PRs are squash-merged, so the PR title becomes the commit on `main`.

## Set up the hooks

```bash
pre-commit install --hook-type pre-commit --hook-type commit-msg
```

The hooks run the linters, a secret scan and the Conventional Commit check before a commit is created.

## Handbook

- [Handbook index](https://github.com/JonathanTSilva/.github/blob/main/handbook/README.md)
- [Naming](https://github.com/JonathanTSilva/.github/blob/main/handbook/naming.md)
- [Branches and commits](https://github.com/JonathanTSilva/.github/blob/main/handbook/branches-and-commits.md)
- [Releases](https://github.com/JonathanTSilva/.github/blob/main/handbook/releases.md)
- [Repo anatomy](https://github.com/JonathanTSilva/.github/blob/main/handbook/repo-anatomy.md)
- [Labels and issues](https://github.com/JonathanTSilva/.github/blob/main/handbook/labels-and-issues.md)
- [Security](https://github.com/JonathanTSilva/.github/blob/main/handbook/security.md)
- [Licensing](https://github.com/JonathanTSilva/.github/blob/main/handbook/licensing.md)
- [Forks](https://github.com/JonathanTSilva/.github/blob/main/handbook/forks.md)
- [Archiving](https://github.com/JonathanTSilva/.github/blob/main/handbook/archiving.md)
- [Publishing](https://github.com/JonathanTSilva/.github/blob/main/handbook/publishing.md)
- [AI assistance](https://github.com/JonathanTSilva/.github/blob/main/handbook/ai.md)
- [Planning](https://github.com/JonathanTSilva/.github/blob/main/handbook/planning.md)
