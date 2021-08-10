#!/bin/bash
set -ex

echo "Start send message"

curl --location --request POST 'https://api.telegram.org/'$telegram_bot_token'/sendMessage' \
--header 'Content-Type: application/json' \
--data-raw '{"chat_id": "'$telegram_id_channel'", "text": $template_message_start, "disable_notification": false, "parse_mode": "HTML"}'

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/test.json' \
--header 'Content-Type: text/plain' \
--data-raw '{"chat_id": "'$telegram_id_channel'", "text": $template_message_start, "disable_notification": false, "parse_mode": "HTML", "bot_id": "$telegram_bot_token"}'