#!/bin/bash
curl -i -X POST -H "Authorization: Bearer "$MR_AUTH_TOKEN"" https://meeting-rooms.cloudapps.digital/send_emails
