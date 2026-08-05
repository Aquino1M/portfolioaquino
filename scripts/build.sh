#!/usr/bin/env bash
set -euo pipefail

mkdir -p dist
cat .github/payload/part-00 .github/payload/part-01 .github/payload/rest-* > /tmp/portfolio.b64

echo "33d62ce52b70fc34e2a30be88831279bef161908829276ada942e8d92eedc36a  /tmp/portfolio.b64" | sha256sum -c -
base64 --decode /tmp/portfolio.b64 > /tmp/portfolio.zip
echo "20d730e8491a0e3cfe98c86cd2665e9ff61bb7a19ef0b6e5a378c0fe4e4b0b1f  /tmp/portfolio.zip" | sha256sum -c -
unzip -t /tmp/portfolio.zip
unzip -o /tmp/portfolio.zip -d dist

printf '\nPortfólio montado em dist/ com integridade validada.\n'
