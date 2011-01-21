require 'rubygems'
require 'bundler/setup'
require 'shoulda'

require 'WoWCombatLogParser' # and any other gems you need

RSpec.configure do |config|
  config.mock_with :rspec
end