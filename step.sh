#!/bin/bash
set -ex

echo "Start send message\n\n"

message=$template_message_start;

if [[ $type_notification = "End build" ]]
then
  if [[ $BITRISE_BUILD_STATUS = 0 ]]
  then
    message=$template_message_end_success;
  else
    message=$template_message_end_error;
  fi
fi

if [[ $type_notification = "End build" ]]
then
    message=$template_message_custom;
fi


curl --location --request POST 'https://api.telegram.org/bot'$telegram_bot_token'/sendMessage' \
--header 'Content-Type: application/json' \
--data-raw "{\"chat_id\": \"$telegram_id_channel\", \"text\": \"$message\", \"disable_notification\": false, \"parse_mode\": \"HTML\"}"
