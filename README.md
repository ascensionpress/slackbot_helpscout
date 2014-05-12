Slackbot Helpscout
==================

Standalone Sinatra app for mapping Helpscout webhook posts into a concise [Slack](https://slack.com) message. Less verbose than the built in Slack integration for Helpscout.

## Getting started

```
$ bundle install
$ rackup
```

## Heroku

You can run Slackbot Helpscout on Heroku using the following commands (you'll need  to have installed
the Heroku toolbelt already):

```
cd slackbot_helpscout
heroku create
heroku config:set SLACK_ORG={YOUR-SLACK-SUBDOMAIN}
heroku config:set SLACK_TOKEN={YOUR-SECRET-TOKEN}
heroku config:set SLACK_CHANNEL={CHANNEL-NAME-INCLUDE-LEADING-POUND-SIGN}
git push heroku master
```