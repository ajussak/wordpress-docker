#!/bin/bash

set -e

echo "account default" > /etc/msmtprc
echo "host $SMTP_HOST" >> /etc/msmtprc
echo "port $SMTP_PORT" >> /etc/msmtprc
echo "tls $SMTP_TLS" >> /etc/msmtprc
echo "tls_starttls $SMTP_STARTTLS" >> /etc/msmtprc
echo "from $SMTP_FROM"  >> /etc/msmtprc
echo "auth $SMTP_AUTH" >> /etc/msmtprc
echo "user $SMTP_USERNAME" >> /etc/msmtprc
echo "password $SMTP_USERNAME" >> /etc/msmtprc

/usr/local/bin/docker-entrypoint.sh "$@"