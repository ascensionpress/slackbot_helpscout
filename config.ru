require File.expand_path("../app", __FILE__)
require 'dotenv'

Dotenv.load

$stdout.sync = true

use Rack::Logger
run SlackbotHelpscout.new