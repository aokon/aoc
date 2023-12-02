require "minitest/autorun"
require_relative "../../test_helper"

describe Aoc::DayOne do
  describe "self.part_one" do
    before do
      @input = <<-INPUT
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
      INPUT
    end

    it "returns valid result result" do
      _(Aoc::DayOne.part_one(@input)).must_equal 142
    end
  end

  describe "self.part_two" do
    before do
      @input = <<-INPUT
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightsevenseven2
        zoneight234
        7pqrstsixteen
        xksghrh7oneone245cvcnrfgtwoneq
      INPUT
    end

    it "returns valid result result" do
      _(Aoc::DayOne.part_two(@input)).must_equal 352
    end
  end
end
