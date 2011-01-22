require 'spec_helper'

describe "Parse Log" do

  it "should successfully parse a combat log" do
    match_results = WoWCombatLogParser::ParseLog.parse(File.expand_path('../fixtures/WoWCombatLog.txt', __FILE__))
    match_results.line_count.should == 2239
    match_results.start_time.to_s.should == DateTime.new(Time.now.year, 1, 21, 11, 51, 59).to_s
    match_results.end_time.to_s.should == DateTime.new(Time.now.year, 1, 21, 11, 55, 01).to_s
    match_results.dead_players.has_key?("Guccimaim").should == true
    match_results.dead_players.has_key?("Billionaire").should_not == true
    match_results.dead_players.has_key?("Viper").should_not == true
    match_results.dead_players["Guccimaim"].to_s.should == DateTime.new(Time.now.year, 1, 21, 11, 54, 54).to_s
  end

end