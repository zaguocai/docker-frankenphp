# FrankenPHP Docker Images

## Quick start

```bash
# Run your existing Laravel project
docker run --rm -it \
  -v $(pwd):/app \
  -p 80:80 -p 443:443 -p 443:443/udp \
  zaguocai/frankenphp:latest

# Docker Compose Example
services:
  app:
    image: zaguocai/frankenphp:latest
    restart: unless-stopped
    volumes:
      - .:/app
      - caddy_data:/data
      - caddy_config:/config
    ports:
      - "80:80"
      - "443:443"
      - "443:443/udp"
    environment:
      PHP_MEMORY_LIMIT: 128M
    depends_on:
      - mysql
      - redis
```

## tags

| Tag                            | Description                                   |
| ------------------------------ | --------------------------------------------- |
| `latest`                       | The Latest of FrankenPHP                      |
| `development`                  | The Latest of FrankenPHP, development version |
| `1.2.3`                        | Specific release                              |
| `1.2.3-development`            | Specific release, development version         |

## License

MIT License
