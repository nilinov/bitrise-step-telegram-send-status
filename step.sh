#!/bin/bash
set -ex

echo "Start send message\n\n"

resJson=eval '{\"chat_id\": \"$telegram_id_channel\", \"text\": \"$template_message_start\", \"disable_notification\": false, \"parse_mode\": \"HTML\"}'

curl --location --request POST 'https://api.telegram.org/bot'$telegram_bot_token'/sendMessage' \
--header 'Content-Type: application/json' \
--data-raw $resJson
