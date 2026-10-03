# Telegram Music Bot

Telegram bot for searching and downloading audio, recognizing music from uploaded audio/video with AudD, and saving tracks to a personal playlist. Public TikTok and Instagram video links are sent as both video and MP3.

## Start

1. Add the required `TELEGRAM_BOT_TOKEN` and `AUDD_API_KEY` values using Replit Secrets. Add `YOUTUBE_API_KEY` to enable YouTube Data API v3 search; without it, the bot logs a warning and uses yt-dlp search as a fallback. Add `PROXY_URL` if yt-dlp should use a proxy. Do not put secret values in source files or chat.
2. Add the bot as an administrator to `@Musiccommomru`. The bot checks channel membership and will not start unless it can access the channel.
3. Run the **Telegram Music Bot** workflow. It starts `bot.py` and exposes a small health check on port `9000`.

The bot uses long polling. Do not run another copy with the same Telegram token at the same time.

## Supported links and clients

- Public TikTok videos and Instagram posts/Reels: tries Cobalt first to send the video plus an MP3 soundtrack, then falls back to yt-dlp if Cobalt fails.
- YouTube search uses the Data API when `YOUTUBE_API_KEY` is configured; yt-dlp remains the search fallback. Audio downloads try Cobalt first and fall back to yt-dlp.
- Arbitrary URLs are rejected; only known supported hosts are passed to `yt-dlp`.
- Telegram sends standard MP4/MP3 files, which work in the iOS, Android, and Windows apps. The bot does not impersonate those devices or sign in to private accounts.
- Private, login-gated, removed, or otherwise unavailable posts cannot be downloaded by this bot.

## Features

- Search YouTube results by song or artist and choose a track to download.
- Show and replay the ten most downloaded tracks.
- Recognize uploaded audio, voice messages, and videos through AudD.
- Personal playlists and download statistics stored in SQLite.
- Russian, English, and Ukrainian interface.
- Bounded download queues, upload-size limits, and a health endpoint.

The SQLite database is stored locally as `music_bot.sqlite3`. Keep a persistent deployment volume if playlists must survive restarts or redeployments.

## Replit uptime

The project is configured for a Reserved VM deployment. Its production command runs the Telegram bot and API server together; the health endpoint reports process status but is not a keep-awake mechanism. The Reserved VM is not published yet—use Replit's Publish flow to start it.

Use downloads only for material you own or have permission to download, and follow the source platform's terms.