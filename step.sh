#!/bin/bash
set -ex

echo "Start send message\n\n"

curl --location --request POST 'https://api.telegram.org/bot1642238046:AAFDNZcDZOqQmWs0yZHOk3jgH-IZUsy_WUc/sendMessage' \
--header 'Content-Type: application/json' \
--data-raw '{"chat_id": "-1001512829838", "text": "'$template_message_start'", "disable_notification": false, "parse_mode": "HTML"}'
