FROM wordpress:php8.1-apache

ADD wascar-wordpress.ini /usr/local/etc/php/conf.d/
RUN docker-php-ext-install pdo_mysql

ENV SMTP_FROM=""
ENV SMTP_HOST=""
ENV SMTP_PORT=25
ENV SMTP_AUTH=off
ENV SMTP_TLS=off
ENV SMTP_STARTTLS=off
ENV SMTP_USERNAME=""
ENV SMTP_PASSWORD=""

RUN apt-get update && apt-get install -y \
  msmtp \
  && rm -rf /var/lib/apt/lists/*

ADD entry.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/entry.sh" ]
CMD [ "apache2-foreground" ]