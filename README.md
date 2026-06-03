# pyranthus-hq/homebrew-tap

Homebrew tap for Pyranthus tools.

## mora

Local-first, agent-agnostic memory CLI.

```sh
brew install pyranthus-hq/tap/mora
```

> **Note:** this tap and the `mora` source repo are currently **private**, so
> `brew install` needs a GitHub token that can read them. Set one with:
> ```sh
> export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"
> ```
> For the smoothest zero-auth experience, make this tap public (the compiled
> binary is published as a release asset; the source stays in the private repo).
>
> For a fully offline / no-auth install, use the bundled `install.sh` from a
> release tarball instead — see the mora README / QUICKSTART.

The cask is published automatically by GoReleaser (`.goreleaser.yaml` →
`homebrew_casks`) on every tagged `mora` release. The current cask was seeded
by hand for `v0.2.0`.
