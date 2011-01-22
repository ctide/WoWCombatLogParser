module WoWCombatLogParser
  
  module ParseLog
    
    @match_results = Match.new
    @guid_mask = 0x0070000000000000
    
    def self.parse_file(filename)
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

      @variables = lines.drop(2)
      @variables = @variables.join(" ").split(",")
      if @variables[0] == "UNIT_DIED" && @variables[4].hex & @guid_mask == 0 then
        name = @variables[5][1..-2]
        @match_results.dead_players[name] = @time
      end
      if (!@match_results.times.has_key?(@time.to_s)) then
        @match_results.times[@time.to_s] = @match_results.line_count
      end
    end
    
  end
  
end