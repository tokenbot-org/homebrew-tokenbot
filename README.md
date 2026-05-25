# homebrew-tokenbot

Homebrew tap for the [TokenBot CLI](https://www.npmjs.com/package/tokenbot).

## Install

```
brew tap tokenbot-org/tokenbot
brew install tokenbot
```

## What it gives you

- `tokenbot` — manage strategies, copiers, exchange links, balances, and webhooks from your terminal
- See `tokenbot --help` after install, or visit https://tokenbot.org for docs

## Updating

```
brew update
brew upgrade tokenbot
```

## Maintaining this tap

To bump the formula after a new `tokenbot` npm release, run:

```
./scripts/bump.sh <new-version>
```

This computes the new tarball sha256 and rewrites `Formula/tokenbot.rb` in place. Then commit + push + open a PR.
