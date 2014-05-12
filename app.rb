require 'bundler/setup'
require 'sinatra'
require 'json'
require 'httparty'
require 'active_support/core_ext/hash/indifferent_access'
require 'slack-notifier'

class SlackbotHelpscout < Sinatra::Base
  attr_reader :payload

  before do
    @payload = JSON.parse(request.body.read).with_indifferent_access
  end

  post "/" do
    content_type :json

    notifier = Slack::Notifier.new ENV['SLACK_ORG'], ENV['SLACK_TOKEN']

    customer = payload["customer"]["email"]
    subject = payload["subject"]
    url = "https://secure.helpscout.net/conversation/#{payload['id']}"

    slack_msg = "#{subject} by #{customer}\n#{url}"
    channel = ENV['SLACK_CHANNEL']

    Slack::Notifier::LinkFormatter.format(slack_msg)
    notifier.ping slack_msg, channel: channel

    "OK\n"
  end
end
