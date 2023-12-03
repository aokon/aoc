# frozen_string_literal: true

module Aoc
  module DayTwo
    def self.part_one(input)
      PartOne.new.call(input)
    end

    def self.part_two(input)
      PartTwo.new.call(input)
    end

    class PartOne
      CUBE_LIMITS = {
        "red" => 12,
        "green" => 13,
        "blue" => 14

      }.freeze

      def call(input)
        input.split("\n").inject(0) do |sum, item|
          id_part, subsets = item.strip.split(":")
          id = id_part.scan(/\d+/).first.to_i
          result = process_subsets(subsets)

          sum += id if result.size == 1 && result.first
          sum
        end
      end

      private

      def process_subsets(subsets)
        subsets.split(";").map { |subset| check_subset(subset) }.uniq
      end

      def check_subset(subset)
        subset_stats = {"red" => 0, "green" => 0, "blue" => 0}
        subset.scan(/((\d+) (red|green|blue))/).each do |cube_parts|
          subset_stats[cube_parts[2]] += cube_parts[1].to_i
        end

        valid?(subset_stats)
      end

      def valid?(stats)
        result = CUBE_LIMITS.map { |cube, limit| stats[cube] <= limit }.uniq

        return false if result.size > 1

        result.first
      end
    end

    class PartTwo
      def call(input)
        input.split("\n").inject(0) do |sum, item|
          subsets = item.strip.split(":").last
          sum += process_subsets(subsets)
          sum
        end
      end

      private

      def process_subsets(subsets)
        subsets.split(";").each_with_object({"red" => [], "green" => [], "blue" => []}) do |subset, memo|
          subset.scan(/((\d+) (red|green|blue))/).each do |cube_parts|
            memo[cube_parts[2]] << cube_parts[1].to_i
          end
        end.inject(1) { |memo, (k, v)| memo *= v.max }
      end
    end
  end
end
