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

  MOVE_MAP_V1 = {
    'A' => { 'C' => :loss, 'A' => :draw, 'B' => :win }, # rock
    'B' => { 'A' => :loss, 'B' => :draw, 'C' => :win }, # paper
    'C' => { 'B' => :loss, 'C' => :draw, 'A' => :win }  # scissors
  }.freeze

  MOVE_MAP_V2 = {
    loss: { 'A' => 'C', 'B' => 'A', 'C' => 'B' },
    draw: { 'A' => 'A', 'B' => 'B', 'C' => 'C' },
    win: { 'A' => 'B', 'B' => 'C', 'C' => 'A' }
  }.freeze

  STRATEGY_GUIDE_V1 = {
    'Y' => 'B',
    'X' => 'A',
    'Z' => 'C'
  }.freeze

  STRATEGY_GUIDE_V2 = {
    'Y' => :draw,
    'X' => :loss,
    'Z' => :win
  }.freeze

  def initialize(file_name = 'input.txt')
    @file_name = file_name
  end

  def first_part
    result = 0
    File.readlines(@file_name).each do |line|
      oponent_move, suggested_move = line.strip.split
      round_status = MOVE_MAP_V1[oponent_move][STRATEGY_GUIDE_V1[suggested_move]]
      result += (SCORE_MAP[STRATEGY_GUIDE_V1[suggested_move]] + ROUND_SCORE[round_status])
    end

    result
  end

  def second_part
    result = 0
    File.readlines(@file_name).each do |line|
      oponent_move, suggested_move = line.strip.split
      round_status = STRATEGY_GUIDE_V2[suggested_move]
      player_move = MOVE_MAP_V2[round_status][oponent_move]
      result += (SCORE_MAP[player_move] + ROUND_SCORE[round_status])
    end

    result
  end
end
