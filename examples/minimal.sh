#!/usr/bin/env sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

if [ -n "${SANDSCOPE_BIN:-}" ]; then
  binary=$SANDSCOPE_BIN
elif [ -x "$repo_dir/target/release/sandscope" ]; then
  binary="$repo_dir/target/release/sandscope"
else
  binary="$repo_dir/sandscope"
fi

if [ -f "$repo_dir/examples/tool.wasm" ]; then
  fixture="$repo_dir/examples/tool.wasm"
else
  fixture="$repo_dir/sandscope/fixtures/tool_return_secret_tool/tool.wasm"
fi

"$binary" \
  --wasm "$fixture" \
  --env DEMO_SECRET=EXAMPLE_ONLY_0123456789abcdef
