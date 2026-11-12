# Labels and issues

## Labels

Source: [`labels.yml`](../labels.yml). `jts-ops` applies the same set to every repo, because issue forms and the PR flow reference these labels.

| Label | Meaning |
|---|---|
| `type: bug` | Something is broken |
| `type: feature` | New capability or enhancement |
| `type: docs` | Documentation only |
| `type: refactor` | Code change that neither fixes a bug nor adds a feature |
| `type: test` | Adding or fixing tests |
| `type: ci` | CI and automation changes |
| `type: chore` | Maintenance with no user-facing change |
| `type: security` | Security fix or hardening |
| `priority: p0` | Drop everything |
| `priority: p1` | High, next up |
| `priority: p2` | Normal |
| `priority: p3` | Low, when time allows |
| `status: triage` | Not yet assessed |
| `status: blocked` | Waiting on something else |
| `status: in-progress` | Being worked on |
| `status: needs-info` | Waiting for more information |
| `size: xs` | Under an hour |
| `size: s` | A few hours |
| `size: m` | About a day |
| `size: l` | A few days |
| `size: xl` | A week or more |
| `good first issue` | Good for newcomers |
| `help wanted` | Extra attention is needed |
| `dependencies` | Dependency updates |
| `ai-generated` | Produced with AI assistance |

Colors are shared per group: all `type:` labels are one color, all `status:` labels are one color, and `priority:` and `size:` are gradients.

The `ai-generated` label marks an issue or PR opened autonomously by an agent. A normal AI-assisted PR does not get it; it uses the AI assistance section of the PR template instead.

## Issue forms

Defaults from [`.github`](https://github.com/JonathanTSilva/.github/tree/main/ISSUE_TEMPLATE): bug report, feature request and question. Blank issues are disabled. Where a repo has Discussions on, they are the place for open questions (see [planning](planning.md)).

## Pull request template

Every PR answers: summary, linked issue, type, how it was tested, a checklist, and an **AI assistance** section stating which tool or model helped and what it did. See [AI assistance](ai.md).
