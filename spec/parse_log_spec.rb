require 'spec_helper'

describe "Parse Log" do

  it "should successfully open a combat log" do
    match_results = WoWCombatLogParser::ParseLog.parse(File.expand_path('../fixtures/WoWCombatLog.txt', __FILE__))
    match_results.line_count.should == 2264
    match_results.start_time.to_s.should == DateTime.new(Time.now.year, 1, 21, 11, 49, 11).to_s
    match_results.end_time.to_s.should == DateTime.new(Time.now.year, 1, 21, 11, 54, 58).to_s
  end

end