module WoWCombatLogParser
  
  module ParseLog
    
    def self.parse(filename)
      line_count = 0
      f = File.open(filename)
      begin
        while (line = f.readline)
          line.chomp
          parse_line(line)
          line_count = line_count + 1
        end
      rescue EOFError
        f.close
      end
      line_count
    end
    
    def self.parse_line(line)
    end
    
  end
  
end