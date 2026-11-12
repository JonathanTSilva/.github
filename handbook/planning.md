# Planning

## The Engineering project

All repos share one user-level GitHub Project, **Engineering**. Issues and pull requests from every repo are added automatically by the built-in auto-add workflow.

| Field | Values |
|---|---|
| Status | Inbox, Todo, In progress, Blocked, Done |
| Priority | Matches the `priority:` labels |
| Area | The repo kind, see [naming](naming.md) |
| Size | Matches the `size:` labels |
| Iteration | 2-week cycles |
| Target date | Used by the roadmap |

| View | Shows |
|---|---|
| Board | Items by status |
| Roadmap | Timeline by target date |
| By repo | Items grouped by repository |
| Inbox | Items in `status: triage` |

## Discussions

On for featured products, and for `.github` itself, which hosts "Ask me" and "Announcements". If `.github` can't host that well, the profile repo `JonathanTSilva` does instead. Off everywhere else. Issues are for work, Discussions are for conversation.

## Wikis

Off everywhere. Documentation lives in the repo (`README.md`, `docs/`) so it is versioned, reviewed and found by search. Existing wiki content is moved into the repo's `docs/` before the wiki is turned off. For example, the wiki of `learn-windows` moves into its `docs/` first.

## Where plans live

Specs and plans for a repo are saved in that repo, under `docs/` (except where a plan names private work, which then stays local). Ideas that start elsewhere become an issue on the repo they concern.
