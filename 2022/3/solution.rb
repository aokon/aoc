# frozen_string_literal: true

class RucksackPlanner
  def initialize(file_name = 'input.txt')
    @file_name = file_name
    @priorities_score = build_priorities_score
  end

  def first_part
    result = 0
    File.readlines(@file_name).each do |line|
      result += divide_item(line)
                .then { |parts| calculate_priorities(parts) }
    end

    result
  end

  private

  def build_priorities_score
    result = {}
    ('a'..'z').each.with_index { |i, index| result[i] = index + 1 }
    ('A'..'Z').each.with_index { |i, index| result[i] = index + 27 }

    result
  end

  def divide_item(line)
    line.strip!
    line_length = line.size
    part_length = line_length / 2
    first = line[0...part_length]
    second = line[part_length..]

    [first, second]
  end

  def calculate_priorities(parts)
    similiar_elements = parts[1].scan(/[#{parts[0]}]/).uniq

    similiar_elements.reduce(0) do |memo, item|
      memo += @priorities_score[item]
      memo
    end
  end
end
