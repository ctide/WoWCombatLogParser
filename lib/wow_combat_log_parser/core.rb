module WoWCombatLogParser
  
  class Match
    attr_accessor :line_count, :start_time, :end_time, :dead_players
    
    def initialize
      self.dead_players = Hash.new
      self.line_count = 0
    end
  end
  
  module Core
  end
end