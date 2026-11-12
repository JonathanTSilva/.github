# Licensing

The license is a per-repo variable of the template. The audit checks the repo's `LICENSE` against this table. Allowed values are in [`standard.yml`](../standard.yml).

| Repo type | Value | License |
|---|---|---|
| Public code | `mit` | MIT |
| Public content-only | `cc-by-4.0` | CC BY 4.0 |
| Code and written content together | `mit+cc-by-4.0` | MIT for code, CC BY 4.0 for content, stated in the README and `LICENSE` |
| Private products and client work | `proprietary` | "Copyright (c) `<year>` Jonathan Tobias. All rights reserved." The repo stays private. |
| Variants of someone else's work | `agpl-3.0` or the upstream license | Upstream license and copyright are kept |
| Company-owned code | `company` | The company's license, never written or changed by tooling. The repo stays private and is archived when the work ends. |

## Rules

- The copyright holder for Jonathan's own work is `Jonathan Tobias`.
- A `LICENSE` file cannot be a community default. It lives in each repo.
- Public repos without a license get one, including archived ones.
- Company-owned means an employer or client owns the code. See [publishing](publishing.md).
