# AI assistance

Every repo is set up for coding agents, and the setup is built into the template rather than remembered.

## Instructions

| File | Role |
|---|---|
| `AGENTS.md` | The single source of agent instructions, read by Codex, Cursor, Copilot, Gemini and others |
| `CLAUDE.md` | Contains only `@AGENTS.md`, so Claude Code imports it and nothing is duplicated |

`AGENTS.md` sections: project overview, setup, test and lint commands, conventions (pointing back to this handbook), boundaries (never commit secrets, never push to `main`), and model routing.

## Agents

`.claude/agents/` ships three subagents with fixed models.

| Agent | Model | Scope |
|---|---|---|
| `architect` | Opus (`claude-opus-5-5`) | Thinking: designs, plans, trade-offs, reviews, anything ambiguous or irreversible |
| `builder` | Sonnet (`claude-sonnet-5-5`) | Building: implementing a scoped task from a plan, writing tests, refactors |
| `mechanic` | Haiku (`claude-haiku-5-5`) | Mechanical: precise, checklist-driven, repetitive edits with a command that verifies them |

## Orchestration rules

1. **Opus thinks.** Design, the implementation plan, the naming map, sanitizing reviews before anything goes public, and the review at the end of each phase.
2. **Sonnet builds.** Each plan task that creates something new, such as a reusable workflow, a template or a CLI command, goes to Sonnet with the task text, the files it may touch and the done-check.
3. **Haiku applies.** Bulk, repetitive, well-specified work: applying the template to many repos, setting topics and descriptions, disabling wikis, syncing labels, adding license files, link checks. Each task gets an exact checklist and a command that proves it is done. A failure escalates to Sonnet, and Haiku never improvises.
4. **Jonathan decides.** Approvals and anything only he can do. Plans mark these `[manual]`, and nothing irreversible runs without them.
5. Every task in an implementation plan is tagged `[opus]`, `[sonnet]`, `[haiku]` or `[manual]`.
6. **Irreversible GitHub actions** (rename, archive, visibility change, delete) are batched into a reviewed list and run only after Jonathan approves that list.

## Disclosure

Pull requests state which tool or model helped and what it did, in the AI assistance section of the PR template. A human verifies everything before merge. The `ai-generated` label has its own narrower meaning, see [labels and issues](labels-and-issues.md).
