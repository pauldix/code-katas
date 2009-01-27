require 'kata_4/part_one.rb'
require 'kata_4/part_two.rb'
require File.dirname(__FILE__) + '/../spec_helper'

describe PartOne do
  describe "#calculate" do
    it "should output the month with the minimum temperature spread" do
      PartOne.calculate("weather.dat")
    end
  end
end

describe PartTwo do  
  describe "#calculate" do    
    it "should output the team with the smallest difference between the for and against goals" do
      PartTwo.calculate("football.dat")
    end
  end
  
  describe "#team_and_spread" do
    it "should return the team name" do
      PartTwo.team_and_spread("1. Arsenal         38    26   9   3    79  -  36    87").first.should == "Arsenal"
    end
    
    it "should return the point spread" do
      PartTwo.team_and_spread("1. Arsenal         38    26   9   3    79  -  36    87").last.should == 43
    end
    
    it "should return a positive number when the against goals are higher than the for goals" do
      PartTwo.team_and_spread("1. Arsenal         38    26   9   3    36  -  79   87").last.should == 43
    end
  end
  
  describe "#line_has_score?" do
    it "should return true for a line with a score" do
      PartTwo.line_has_score?("1. Arsenal         38    26   9   3    79  -  36    87").should be_true
    end
    
    it "should return nil for a line without a score" do
      PartTwo.line_has_score?(%{href="http://sunsite.tut.fi/rec/riku/soccer_data/tab/93_94/table.eng0.01_02.html">sunsite.tut.fi/rec/riku/soccer_data/tab/93_94/table.eng0.01_02.html</a>}).should be_nil
    end
  end
end