# 构建参数（构建时可覆盖）
ARG FRANKENPHP_VERSION=1.12.2
ARG COMPOSER_VERSION=latest

# ─── 1. Composer 镜像 ──────────────────────────
FROM composer:${COMPOSER_VERSION} AS composer

# ─── 2. 基础运行环境 ──────────────────────────
FROM dunglas/frankenphp:${FRANKENPHP_VERSION} AS base

# 安装 PHP 扩展并清理
RUN install-php-extensions \
        mysqli \
        pdo_mysql \
        pdo_pgsql \
        redis \
        gd \
        exif \
        bcmath \
        intl \
        zip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ─── 3. 开发环境 ────────────────────────────────
FROM base AS development

RUN install-php-extensions xdebug && \
    echo "xdebug.mode=off" >> "$PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini" && \
    cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# ─── 4. 生产环境 ────────────────────────────────
FROM base AS production

RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

COPY docker-php-ext-opcache.ini "$PHP_INI_DIR/conf.d/docker-php-ext-opcache.ini"
