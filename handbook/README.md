# Handbook

The engineering standard behind every repo on [JonathanTSilva](https://github.com/JonathanTSilva). It is short on purpose: each page states the rule. Where a rule can be checked, `jts-ops audit` or CI checks it; the audit profiles in [`standard.yml`](../standard.yml) define what is checked.

## Why

Organization is part of the work. Every active repo here uses the same names, files, badges, CI and release flow, so you can open any of them and know where things are. The standard is data (see [`standard.yml`](../standard.yml), [`labels.yml`](../labels.yml) and [`inventory.yml`](../inventory.yml)), and [jts-ops](https://github.com/JonathanTSilva/jts-ops) audits it, so it cannot quietly drift. New repos are created from the Copier template [`template-repo`](https://github.com/JonathanTSilva/template-repo) with `jts-ops new`, and existing repos are re-synced with `copier update`.

## Pages

| Page | Covers |
|---|---|
| [Naming](naming.md) | Repo names, kinds, emoji, topics, description rules |
| [Branches and commits](branches-and-commits.md) | GitHub Flow, branch names, Conventional Commits, squash merge |
| [Releases](releases.md) | SemVer, release-please, provenance, packages |
| [Repo anatomy](repo-anatomy.md) | Required files, README structure, badge row, CI menu |
| [Labels and issues](labels-and-issues.md) | The label set, issue forms, PR template |
| [Security](security.md) | Reporting, scanning, rulesets, workflow hardening |
| [Licensing](licensing.md) | Which license goes on which repo |
| [Forks](forks.md) | Contribution forks and variants |
| [Archiving](archiving.md) | The archive kit and the README banner |
| [Publishing](publishing.md) | Sanitize checklist for work-born code |
| [AI assistance](ai.md) | `AGENTS.md`, the three agents, orchestration rules |
| [Planning](planning.md) | The Engineering project, Discussions, wikis |

## Principles

- Documentation lives in the repo it describes.
- The ecosystem wins when it requires a name or a file.
