require 'rubygems'
require 'bundler/setup'
require 'shoulda'

require File.expand_path('../../lib/WoWCombatLogParser.rb', __FILE__)

RSpec.configure do |config|
  config.mock_with :rspec
end