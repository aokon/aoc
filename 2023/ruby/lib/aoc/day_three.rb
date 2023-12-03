# frozen_string_literal: true

module Aoc
  module DayThree
    def self.part_one(input)
      PartOne.new.call(input)
    end

    class PartOne
      SYMBOLS = /\#|\+|\*|\$/

      def call(input)
        input.split("\n")
          .map { |line| line.strip.chars }
          .then { |engine| calculate_numbers(engine) }
      end

      private

      def calculate_numbers(engine)
        numbers = []

        engine.each.with_index do |row, hi|
          number = {value: "", symbol?: []}
          row_size = row.size
          row.each.with_index do |item, vi|
            if item.match?(/\d/)
              number[:value] += item
              number[:symbol?].push(check_symbol(engine, row_size, hi, vi))
            elsif item.match?(/\./) && number[:value] != ""
              numbers.push(number[:value].to_i)
              number = {value: "", symbol?: []}
            end
          end
        end

        numbers.sum
      end

      def check_symbol(engine, row_size, hi, vi)
        above = hi - 1
        below = hi + 1
        engine_size = engine.size
        status = false



        #[{x: above, y: vi - 1}, {x: above, y: vi}, {x: above, y: vi + 1},
          #{x: hi, y: vi - 1}, {x: hi, y: vi + 1},
          #{x: below, y: vi - 1}, {x: below, y: vi}, {x: above, y: vi + 1}].each do |cords|

          #next if cords[:x].negative? || cords[:y].negative? || engine_size < cords[:x] || row_size < cords[:y]
          #puts cords
          #next if !engine[cords[:x]].at(cords[:y]).match?(/\+/)

          #status = true
          #break
        #end

        status
      end
    end
  end
end
