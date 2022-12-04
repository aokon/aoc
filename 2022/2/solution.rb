# frozen_string_literal: true

class GameStrategy
  SCORE_MAP = {
    'A' => 1,
    'B' => 2,
    'C' => 3
  }.freeze

  ROUND_SCORE = {
    win: 6,
    draw: 3,
    loss: 0
  }.freeze

  MOVE_MAP = {
    'A' => { 'C' => :loss, 'A' => :draw, 'B' => :win }, # rock
    'B' => { 'A' => :loss, 'B' => :draw, 'C' => :win }, # paper
    'C' => { 'B' => :loss, 'C' => :draw, 'A' => :win }  # scissors
  }.freeze

  STRATEGY_GUIDE = {
    'Y' => 'B',
    'X' => 'A',
    'Z' => 'C'
  }.freeze

  def initialize(file_name = 'input.txt')
    @file_name = file_name
  end

  def call
    result = 0
    File.readlines(@file_name).each do |line|
      oponent_move, suggested_move = line.strip.split
      round_status = MOVE_MAP[oponent_move][STRATEGY_GUIDE[suggested_move]]
      result += (SCORE_MAP[STRATEGY_GUIDE[suggested_move]] + ROUND_SCORE[round_status])
    end

    result
  end
end
