# Archiving

Archived repos get the **archive kit** and nothing else. Old code is not modernized, so there is no template, `AGENTS.md`, CI, devcontainer or README restructure, and archived repos are never re-synced with `copier update`. The audit uses the lighter `archived` profile, which requires only `README.md`.

## Steps

1. Rename to the [naming convention](naming.md). GitHub redirects the old URL.
2. Add the banner below to the top of the README, and add the `status-archived` topic.
3. Set the repostatus.org badge: `inactive` for finished work, `unsupported` for abandoned work.
4. Turn the wiki off and update the description.
5. Add a `LICENSE` if the repo is public and has none (see [licensing](licensing.md)).
6. Archive the repo (read-only).

Archiving goes on the reviewed list of irreversible actions (see [AI assistance](ai.md)), so it is batched and approved, never done ad hoc.

## Banner

Tooling looks for the two marker comments, so keep them exactly as written.

```markdown
<!-- archive-banner:start -->
> [!NOTE]
> **This repository is archived.** It is read-only and no longer maintained. It is kept as a record of the work.
<!-- archive-banner:end -->
```
