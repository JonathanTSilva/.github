# Releases

## Versions

[SemVer](https://semver.org) tags in the form `vMAJOR.MINOR.PATCH`, for example `v1.4.2`. Breaking changes bump MAJOR, features bump MINOR, fixes bump PATCH.

## release-please

[release-please](https://github.com/googleapis/release-please) reads the Conventional Commits on `main`, keeps a release pull request open, and on merge:

- updates `CHANGELOG.md`,
- creates the `vX.Y.Z` tag,
- publishes the GitHub Release.

Nobody edits the changelog or tags by hand. The shared `release` workflow in [`.github`](https://github.com/JonathanTSilva/.github) runs it, and each repo calls it from its `ci.yml`.

Pull requests opened with the default `GITHUB_TOKEN` do not trigger CI, so the required `ci` check would never run on the release PR. Callers pass a PAT or GitHub App token with `secrets: token: ${{ secrets.RELEASE_PLEASE_TOKEN }}`.

Every repo that releases needs `RELEASE_PLEASE_TOKEN`. With the account's default settings the `GITHUB_TOKEN` cannot create pull requests at all, so without the token (or without enabling "Allow GitHub Actions to create and approve pull requests" in the repo's Actions settings) release-please fails to open the release PR. Even with that setting enabled, someone has to re-trigger CI on the release PR by hand.

## Provenance

When a release ships artifacts, the `release` workflow attaches a build provenance attestation with `actions/attest-build-provenance`, so anyone can verify the artifact was built by this repo's CI.

## Maintenance branches

A product that must keep supporting an older major gets a `release/<major>.x` branch. Fixes land on `main` first, then are cherry-picked.

## Packages and Pages

| Output | Where |
|---|---|
| Container images | GitHub Container Registry (GHCR), only for repos that ship one |
| Docs sites, reports | GitHub Pages, where a repo needs one |
