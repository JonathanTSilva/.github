# .github

The GitHub standard for [JonathanTSilva](https://github.com/JonathanTSilva), kept as data. The tools in [jts-ops](https://github.com/JonathanTSilva/jts-ops) read these files to audit and apply the standard across every repo.

## Data files

| File | Holds | Schema |
|---|---|---|
| [`standard.yml`](standard.yml) | Naming rule, repo kinds with emoji and topics, statuses, audit profiles, licenses | [`standard.schema.json`](schemas/standard.schema.json) |
| [`labels.yml`](labels.yml) | The label set applied to every repo | [`labels.schema.json`](schemas/labels.schema.json) |
| [`inventory.yml`](inventory.yml) | Every repo: current name, target name, kind, visibility, fate, profile, license, status | [`inventory.schema.json`](schemas/inventory.schema.json) |

Each file is validated against its schema on every pull request and push to `main`.

## Validate locally

```bash
for name in standard labels inventory; do
  uvx check-jsonschema==0.39.0 --schemafile "schemas/${name}.schema.json" "${name}.yml"
done
uvx --from actionlint-py==1.7.12.25 actionlint
uvx zizmor==1.32.0 .github/workflows
```

## Contributing

Change the data file and its schema together, then open a pull request. Branches are named `<type>/<issue>-<slug>` and PR titles follow Conventional Commits.

## License

MIT. The license file is added with the standard repo files.
