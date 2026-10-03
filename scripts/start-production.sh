#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

BOT_PID=""
API_PID=""

cleanup() {
  if [[ -n "$BOT_PID" ]]; then
    kill "$BOT_PID" 2>/dev/null || true
  fi
  if [[ -n "$API_PID" ]]; then
    kill "$API_PID" 2>/dev/null || true
  fi
  if [[ -n "$BOT_PID" ]]; then
    wait "$BOT_PID" 2>/dev/null || true
  fi
  if [[ -n "$API_PID" ]]; then
    wait "$API_PID" 2>/dev/null || true
  fi
}

trap cleanup EXIT
trap 'exit 143' TERM
trap 'exit 130' INT

PORT=9000 python bot.py &
BOT_PID=$!

PORT=8080 NODE_ENV=production \
  node --enable-source-maps artifacts/api-server/dist/index.mjs &
API_PID=$!

set +e
wait -n "$BOT_PID" "$API_PID"
status=$?
set -e
exit "$status"