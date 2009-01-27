require 'ostruct'

class PartOne
  def self.calculate(file_name)
    minimum = raw_data(lines(file_name)).inject(OpenStruct.new(:month => nil, :spread => nil)) do |min, line| 
      month, spread = month_and_spread_from_line(line)
      if min.spread.nil? || spread < min.spread
        min = OpenStruct.new(:month => month, :spread => spread)
      else
        min = min
      end
    end
    
    puts "Minimum spread: #{minimum.spread} in month #{minimum.month}"
  end
  
  def self.part_two(file_name)
    minimum = raw_
  end
  
  private
  
  def self.lines(file_name)
    File.readlines("#{File.dirname(__FILE__)}/#{file_name}")
  end
  
  def self.raw_data(file_lines)
    file_lines.slice(8, 31)
  end
  
  def self.month_and_spread_from_line(line)
    data = line.split
    [month(data), max_temperature(data) - min_temperature(data)]
  end
  
  def self.month(data)
    data.first
  end
  
  def self.max_temperature(data)
    data[1].chomp("*").to_f
  end
  
  def self.min_temperature(data)
    data[2].chomp("*").to_f
  end
end