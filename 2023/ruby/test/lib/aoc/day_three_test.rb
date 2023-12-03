require "minitest/autorun"
require_relative "../../test_helper"

describe Aoc::DayThree do
  describe "self.part_one" do
    before do
      @input = <<-INPUT
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      INPUT
    end

    it "returns valid result" do
      _(Aoc::DayThree.part_one(@input)).must_equal 4361
    end
  end
end
