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
                .then { |parts| similiar_elements(parts) }
                .then { |sm| calculate_priorities(sm) }
    end

    result
  end

  def part_two
    result = 0
    group = []

    File.readlines(@file_name).each.with_index do |line, index|
      group.push(line.strip)

      if ((index + 1) % 3).zero?
        result += similiar_group_elements(group).then { |sm| calculate_priorities(sm) }
        group = []
      end
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

  def similiar_elements(parts)
    parts[1].scan(/[#{parts[0]}]/).uniq
  end

  def calculate_priorities(similiar_elements)
    similiar_elements.reduce(0) do |memo, item|
      memo += @priorities_score[item]
      memo
    end
  end

  def similiar_group_elements(group)
    second_group = group[1].chars
    third_group = group[2].chars

    group[0].chars
            .select { |c| second_group.include?(c) && third_group.include?(c) }
            .uniq
  end
end
