# frozen_string_literal: true

# Defines player object
class Player
  attr_reader :mark_type, :name, :marks
  attr_accessor :turn, :score

  def initialize(mark_type, name, turn: false, score: 0)
    @mark_type = mark_type
    @name = name
    @turn = turn
    @score = score
    @marks = []
  end

  def choose_position(board, number)
    new_mark = Mark.new(@mark_type, number)
    @marks << new_mark
    board.add_mark(new_mark)
  end

  def marks_positions
    @marks.map(&:position)
  end

  def clear_marks
    @marks.clear
  end
end
