# Meeting Rooms 20% Project cron job

This app schedules a cron job in Cloud Foundry to trigger the email sending functionality of the meeting room app, found [here](https://github.com/Wynndow/meeting_room_project).
It is created with the 18F cf-cron app which can be found [here](https://github.com/18F/cg-cron).

## Technical documentation

It's a node app which triggers a bash script at 8am every morning. The bash script uses curl to make a POST request to the meeting room app. This triggers the sending of reminder emails.

The app expects a bound service holding credentials, which can be used within the app. The `creds` prefix used in the `crontab.yml` denotes that the parameter will evaluate to a variable held by this bound service.

### Running the application

First, the bound service needs to be created as below, replacing `{{AUTH_TOKEN}}` with the auth token used in the meeting room app.

`cf cups meeting-rooms-cron-creds -p '{"token":"{{AUTH_TOKEN}}"}'`

Now push the app to the same space as the meeting room app, but don't start it.

`cf push --no-start meeting-rooms-cron`

As the app presents no API endpoints, the health check will fail and the app will be terminated. To fix that, it needs to be set to not require a health check.

`cf set-health-check meeting-rooms-cron 'none'`

Now start the app.

`cf start meeting-rooms-cron`
