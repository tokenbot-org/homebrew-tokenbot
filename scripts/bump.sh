#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "Usage: $0 <new-version> (without 'v' prefix, e.g. 0.1.0-beta.2 or 1.0.0)"
  exit 1
fi

VERSION="$1"
URL="https://registry.npmjs.org/tokenbot/-/tokenbot-${VERSION}.tgz"

echo "Fetching $URL ..."
SHA="$(curl -fsSL "$URL" | shasum -a 256 | cut -d' ' -f1)"
echo "  sha256: $SHA"

# In-place rewrite of url + sha256 in Formula/tokenbot.rb
# (uses portable sed flags — works on both macOS and Linux)
sed -i.bak \
  -e "s|^  url \".*\"|  url \"$URL\"|" \
  -e "s|^  sha256 \".*\"|  sha256 \"$SHA\"|" \
  Formula/tokenbot.rb
rm Formula/tokenbot.rb.bak

echo "Bumped Formula/tokenbot.rb to $VERSION"
git diff Formula/tokenbot.rb
