# KDE Docker Package

Docker configuration for self-hosted services on a KDE-based home server.

## Services

- Minecraft Paper server (`minecraft/compose.yaml`)
- Jellyfin runtime installation (local data excluded)
- RustDesk runtime installation (local data excluded)

Only reproducible configuration belongs in this repository. Runtime data,
databases, logs, caches, worlds, backups, binaries, and secrets are excluded.

## Minecraft

1. Copy `.env.example` to `.env` and adjust values as needed.
2. Place the Paper server JAR named in `minecraft/compose.yaml` in the Minecraft
   data directory.
3. Accept the Minecraft EULA in that runtime directory.
4. Start the service:

   ```sh
   docker compose --env-file .env -f minecraft/compose.yaml up -d
   ```

The Compose file defaults to storing runtime data inside `minecraft/`; those
files are ignored by Git.

## Security

Never force-add ignored files. In particular, do not commit `.env` files,
RustDesk identity keys, Jellyfin configuration or databases, Minecraft worlds
or player data, logs, or backups.

