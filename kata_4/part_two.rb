class PartTwo
  class << self
    def calculate(file_name)
      team, spread = nil, 500
      File.readlines("#{File.dirname(__FILE__)}/#{file_name}").each do |line|
        if line_has_score?(line)
          new_team, new_spread = team_and_spread(line)
          team, spread = new_team, new_spread if new_spread < spread
        end
      end
      puts "#{team} had the smallest spread of #{spread} points"
    end
    
    def team_and_spread(line)
      data = line.split
      [data[1], (data[6].to_i - data[8].to_i).abs]
    end
    
    def line_has_score?(line)
      line =~ /.*\d\d\s+\-\s+\d\d.*/
    end
  end
end