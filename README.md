# FrankenPHP Docker Images

## Quick start

```bash
# Run a container
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

## Tags

| Tag                            | Description                                   |
| ------------------------------ | --------------------------------------------- |
| `latest`                       | The Latest of FrankenPHP                      |
| `dev`                          | The Latest of FrankenPHP, development version |
| `1.2.3`                        | Specific release                              |
| `1.2.3-dev`                    | Specific release, development version         |

## Extensions

`bcmath` `Core` `ctype` `curl` `date` `dom` `exif` `fileinfo` `filter` `gd` `hash` `iconv` `intl` `json` `lexbor` `libxml` `mbstring` `mysqli` `mysqlnd` `openssl` `pcre` `PDO` `pdo_mysql` `pdo_pgsql` `pdo_sqlite` `Phar` `posix` `random` `readline` `redis` `Reflection` `session` `SimpleXML` `sodium` `SPL` `sqlite3` `standard` `tokenizer` `uri` `xml` `xmlreader` `xmlwriter` `Zend OPcache` `zip` `zlib`

## License

MIT License
