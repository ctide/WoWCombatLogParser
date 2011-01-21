module WoWCombatLogParser
  
  module ParseLog
    
    @match_results = Match.new
    
    def self.parse(filename)
      @match_results.line_count = 0
      f = File.open(filename)
      begin
        while (line = f.readline)
          line.chomp
          parse_line(line)
          @match_results.line_count = @match_results.line_count + 1
        end
      rescue EOFError
        f.close
      end
      @match_results
    end
    
    def self.parse_line(line)
      lines = line.split(" ")
      @time = DateTime.parse(lines[0] + " " + lines[1])
      if (@match_results.start_time.nil?)
        @match_results.start_time = @time
      end
      @match_results.end_time = @time
    end
    
  end
  
end