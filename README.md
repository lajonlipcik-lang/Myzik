# Telegram Music Bot

Telegram bot for searching and downloading audio, recognizing music from uploaded audio/video with AudD, and saving tracks to a personal playlist.

## Start

1. Add the `TELEGRAM_BOT_TOKEN` and `AUDD_API_KEY` values using Replit Secrets. Do not put either value in source files or chat.
2. Add the bot as an administrator to `@Musiccommomru`. The bot checks channel membership and will not start unless it can access the channel.
3. Run the **Telegram Music Bot** workflow. It starts `bot.py` and exposes a small health check on port `9000`.

The bot uses long polling. Do not run another copy with the same Telegram token at the same time.

## Features

- Search YouTube results by song or artist and choose a track to download.
- Recognize uploaded audio, voice messages, and videos through AudD.
- Personal playlists stored in SQLite.
- Russian, English, and Ukrainian interface.
- Bounded download queues, upload-size limits, and a health endpoint.

The SQLite database is stored locally as `music_bot.sqlite3`. Keep a persistent deployment volume if playlists must survive restarts or redeployments.

Use downloads only for material you own or have permission to download, and follow the source platform's terms.