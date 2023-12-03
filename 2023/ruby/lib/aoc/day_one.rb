# frozen_string_literal: true

module Aoc
  module DayOne
    WORDS_TO_NUMBERS = {
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9"

    }.freeze

    def self.part_one(input)
      input.split("\n").inject(0) do |sum, item|
        numbers = item.strip.scan(/\d/)
        sum += [numbers.first, numbers.last].join.to_i
      end
    end

    def self.part_two(input)
      pattern = WORDS_TO_NUMBERS.keys.join("|")

      input.split("\n").inject(0) do |sum, item|
        # TIL ?= regexp flag
        numbers = item.strip.scan(/(?=(\d|#{pattern}))/).flatten
        first_number = numbers.first.gsub(/#{pattern}/, WORDS_TO_NUMBERS)
        last_number = numbers.last.gsub(/#{pattern}/, WORDS_TO_NUMBERS)

        sum += [first_number, last_number].join.to_i
      end
    end
  end
end
