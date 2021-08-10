#!/bin/bash
set -ex

echo "Start send message"

echo "\n\n\n\n\n"

curl --location --request POST 'https://api.telegram.org/1642238046:AAFDNZcDZOqQmWs0yZHOk3jgH-IZUsy_WUc/sendMessage' \
--header 'Content-Type: application/json' \
--data-raw '{"chat_id": "1642238046", "text": "'$template_message_start'", "disable_notification": false, "parse_mode": "HTML"}'

echo "\n\n\n\n\n"

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/chat.json' \
--header 'Content-Type: text/plain' \
--data-raw '{"d": "'$telegram_id_channel'"}'

echo "\n\n\n\n\n"

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/bot.json' \
--header 'Content-Type: text/plain' \
--data-raw '{"d": "'$telegram_bot_token'"}'

echo "\n\n\n\n\n"

curl --location --request POST 'https://qut-mobile-app-default-rtdb.firebaseio.com/message.json' \
--header 'Content-Type: text/plain' \
--data-raw '{"d": "'$template_message_start'"}'
