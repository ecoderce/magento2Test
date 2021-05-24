FROM php:7.4-fpm
RUN buildDeps=" \
        apt-utils \
        libzip-dev \
        libcurl4-openssl-dev \
        libpng-dev \
        libjpeg-dev \
        libicu-dev \
        libmcrypt-dev \
        libpcre3-dev \
        libxml2-utils \
        libxslt1-dev \
        libfreetype6-dev \
        libsodium-dev \
        libmagickwand-dev \
        libjpeg62-turbo-dev \
        libbz2-dev \
        libgeoip-dev \
        libmagickcore-dev \
        libyaml-dev \
        libxml2-dev \
        libonig-dev \
        freetype* \
        mariadb-client \
        openssh-client \
        openssl \
        rsync \
        unzip \
        sendmail-bin \
        sendmail \
        zip \
    "; \
    phpExt=" \
        bcmath \
        ctype \
        curl \
        dom \
        json \
        gd \
        iconv \
        intl \
        mbstring \
        pdo_mysql \
        soap \
        xml \
        xsl \
        zip \
        sodium \
        sockets \
    "; \
    set -x \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) $phpExt \
    && pecl install oauth imagick mcrypt-1.0.3 && docker-php-ext-enable oauth imagick mcrypt\
    && apt-get purge -y --auto-remove

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --version=1.10.17 --filename=composer
COPY --from=composer:1.10.17 /usr/bin/composer /usr/bin/composer

#Install n98-magerun2.phar and move to /usr/bin/
RUN curl -O https://files.magerun.net/n98-magerun2.phar && chmod +x ./n98-magerun2.phar && mv ./n98-magerun2.phar /bin/magerun2

ADD php.ini /usr/local/etc/php/php.ini

RUN apt-get update
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8