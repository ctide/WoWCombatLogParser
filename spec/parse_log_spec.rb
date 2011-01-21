require 'spec_helper'

describe "Parse Log" do

  it "should successfully open a combat log" do
    WoWCombatLogParser::ParseLog.parse(File.expand_path('../fixtures/WoWCombatLog.txt', __FILE__)).should == 2264
  end

end