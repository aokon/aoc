# frozen_string_literal: true

class SectionAssigment
  def initialize(file_name = 'input.txt')
    @file_name = file_name
  end

  def first_part
    result = 0
    File.readlines(@file_name).each do |line|
      line.strip!.split(',')
          .then { |first, second| [convert_to_range(first), convert_to_range(second)] }
          .then { |first, second| result += 1 if overlap?(first, second) }
    end

    result
  end

  private

  def convert_to_range(str)
    str.split('-').then { |r| r[0].to_i..r[1].to_i }
  end

  def overlap?(first, second)
    first.cover?(second) || second.cover?(first)
  end
end
