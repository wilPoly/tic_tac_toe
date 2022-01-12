# frozen_string_literal: true

# Defines player object
class Player
  attr_reader :mark_type, :name
  attr_accessor :turn, :score

  def initialize(mark_type, name, turn: false, score: 0)
    @mark_type = mark_type
    @name = name
    @turn = turn
    @score = score
  end

  def choose_position(board, number)
    new_mark = Mark.new(@mark_type, number)
    board.add_mark(new_mark)
  end

  def win
    @score += 1
  end
end
