# anidl-docker

```yaml
services:
  anidl:
    image: ghcr.io/ravencentric/anidl-docker:latest
    container_name: anidl
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
    volumes:
      - type: bind
        source: /host/path/to/videos
        target: /usr/local/bin/multi-downloader-nx-linux-x64-cli/videos

      - type: bind
        source: /host/path/to/widevine
        target: /usr/local/bin/multi-downloader-nx-linux-x64-cli/widevine

      - type: bind
        source: /host/path/to/playready
        target: /usr/local/bin/multi-downloader-nx-linux-x64-cli/playready

      - type: bind
        source: /host/path/to/fonts
        target: /usr/local/bin/multi-downloader-nx-linux-x64-cli/fonts

      - type: bind
        source: /host/path/to/config
        target: /usr/local/bin/multi-downloader-nx-linux-x64-cli/config
```
