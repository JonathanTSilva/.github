# Naming

Repo names are lowercase kebab-case: `a-z`, `0-9` and `-`, matching `^[a-z0-9]+(-[a-z0-9]+)*$`. Keep them short and descriptive, with no abbreviation a stranger cannot decode. Code inside a repo follows its language's rules (Python packages use `snake_case`).

**Rule:** a product gets its own name. Everything else is `<kind>-<subject>`. If an ecosystem requires a name pattern, the ecosystem wins.

## Kinds

Source: [`standard.yml`](../standard.yml). Each repo carries the topic in the last column.

| Kind | Pattern | Emoji | Use for | Example | Topic |
|---|---|---|---|---|---|
| Product | `<name>` | ➕ | Something people use or install | `scriptize` | `kind-product` |
| Personal infra | `jts-<thing>` | 🧠 | Jonathan's own systems | `jts-ops`, `jts-website` | `kind-jts` |
| AI | `ai-<subject>` | 🤖 | Agents, skills, MCP servers, prompt libraries | `ai-code-reviewer` | `kind-ai` |
| Research | `research-<subject>` | 🔬 | Academic research and theses | `research-pump-cavitation` | `kind-research` |
| Course | `course-<subject>` | 📖 | Coursework, class projects | `course-signal-processing` | `kind-course` |
| Learning lab | `learn-<subject>` | 🛠 | Code written while learning a technology | `learn-git` | `kind-learn` |
| Template | `template-<subject>` | 📚 | Template repositories | `template-repo` | `kind-template` |
| Challenge | `challenge-<subject>` | 🏁 | Coding tests, katas, interview challenges | `challenge-linked-list` | `kind-challenge` |
| Proof of concept | `poc-<subject>` | 🧪 | Throwaway experiments | `poc-ble-scanner` | `kind-poc` |
| Infrastructure | `infra-<subject>` | 🏗 | IaC, server and network configs | `infra-home-server` | `kind-infra` |
| GitHub Action | `<name>-action` | ⚙️ | Actions published to the Marketplace | `changelog-action` | `kind-action` |
| Obsidian plugin | `obsidian-<name>` | 🔌 | Obsidian community plugins | `obsidian-note-linter` | `kind-obsidian-plugin` |
| Homebrew tap | `homebrew-<name>` | 🍺 | Homebrew taps | `homebrew-tools` | `kind-homebrew-tap` |
| Awesome list | `awesome-<subject>` | 🕶 | Curated lists | `awesome-embedded` | `kind-awesome` |
| Special | fixed by GitHub | ⭐ | Profile, Pages user site, community defaults | `JonathanTSilva`, `jonathantsilva.github.io`, `.github` | `kind-special` |

Examples other than the real repos named in [`inventory.yml`](../inventory.yml) are invented. A new kind is added to [`standard.yml`](../standard.yml) first, then to this table: plain English word, then subject.

## Repo metadata

Every repo has:

- **Description:** one sentence, starts with the kind's emoji, no final period. Example: `🔬 Diagnostic system for hydraulic pump failures`.
- **Topics:** the `kind-<kind>` topic, one status topic, the primary language or languages, and domain topics.
- **Homepage:** the docs site or a jontobias.com page, when one exists.
- **Social preview:** one shared template, uploaded by hand (GitHub has no API for it), for public repos that are not archived.

## Statuses

Source: [`standard.yml`](../standard.yml). A repo has one status topic, `status-<status>`.

| Status | Meaning |
|---|---|
| `concept` | An idea, nothing usable yet |
| `wip` | Being built, not yet released |
| `active` | Maintained and in use |
| `inactive` | Finished or paused, no planned work |
| `unsupported` | Abandoned, no fixes |
| `archived` | Read-only on GitHub, see [archiving](archiving.md) |
