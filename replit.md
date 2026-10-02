# Telegram Music Bot

A Telegram bot for music search, audio recognition, downloads, and personal playlists.

## Run & Operate

- `pnpm --filter @workspace/api-server run dev` — run the API server (port 5000)
- `PORT=9000 python bot.py` — run the Telegram music bot and its health endpoint
- `pnpm run typecheck` — full typecheck across all packages
- `python -m py_compile bot.py` — check the bot's Python syntax
- `pip install -r requirements.txt` — install the bot's Python dependencies
- `pnpm run build` — typecheck + build all packages
- `pnpm --filter @workspace/api-spec run codegen` — regenerate API hooks and Zod schemas from the OpenAPI spec
- `pnpm --filter @workspace/db run push` — push DB schema changes (dev only)
- Required Replit Secrets: `TELEGRAM_BOT_TOKEN`, `AUDD_API_KEY`
- The bot must be an administrator of `@Musiccommomru`; startup intentionally fails if it cannot verify channel access.

## Stack

- pnpm workspaces, Node.js 24, TypeScript 5.9; Python 3.11 for the Telegram bot
- API: Express 5
- DB: PostgreSQL + Drizzle ORM
- Validation: Zod (`zod/v4`), `drizzle-zod`
- API codegen: Orval (from OpenAPI spec)
- Build: esbuild (CJS bundle)

## Where things live

- `bot.py` — Telegram bot logic, inherited from the supplied project
- `requirements.txt` — Python dependencies
- `music_bot.sqlite3` — local SQLite playlist database created at runtime
- `artifacts/api-server` — shared API service

## Architecture decisions

- The bot uses Telegram long polling and runs as its own persistent workflow.
- SQLite stores playlists and sent-audio references; use persistent storage for playlists that must survive redeployments.

## Product

- Search for tracks, download audio, recognize uploaded music with AudD, manage a personal playlist, and use the bot in Russian, English, or Ukrainian.

## User preferences

_Populate as you build — explicit user instructions worth remembering across sessions._

## Gotchas

- Only one process should poll Telegram updates for a given bot token.
- The bot checks membership against `@Musiccommomru` and requires administrator access there.

## Pointers

- See the `pnpm-workspace` skill for workspace structure, TypeScript setup, and package details
