#!/bin/bash
curl -i -X POST -H "Authorization: Bearer "$1"" https://meeting-rooms.cloudapps.digital/send_emails
