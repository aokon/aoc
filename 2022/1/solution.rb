# frozen_string_literal: true

class CaloriesCalculator
  def initialize
    @result = []

    calculate_callories
  end

  def max_calory
    @result.max
  end

  def top_calories
    @result.sort[-3..].sum
  end

  private

  def calculate_calories
    total_calories = 0

    File.readlines('input.txt').each do |line|
      line.strip!

      if line.size.zero?
        @result.push(total_calories)
        total_calories = 0
        next
      end

      total_calories += line.to_i
    end
  end
end
