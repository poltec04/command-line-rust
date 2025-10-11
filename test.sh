#!/usr/bin/env bash
set -euo pipefail

cargo fmt --all -- --check

for DIR in [01]*; do
    DIRNAME=$(basename "$DIR")
    echo "==> $DIRNAME <=="
    (cd "$DIR" && cargo test -q > /dev/null && cargo clippy -- -D warnings)
done

echo "Done."
