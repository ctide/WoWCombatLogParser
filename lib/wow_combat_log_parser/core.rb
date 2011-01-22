module WoWCombatLogParser
  
  class Match
    attr_accessor :line_count, :start_time, :end_time, :dead_players, :lines, :times
    
    def initialize
      self.dead_players = Hash.new
      self.line_count = 0
      self.times = Hash.new
      self.lines = Array.new
    end
  end
  
  module Core
  end
end