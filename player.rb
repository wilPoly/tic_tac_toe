# frozen_string_literal: true

# Defines player object
class Player
  attr_reader :mark, :name
  attr_accessor :turn, :score

  def initialize(mark, name, turn: false, score: 0)
    @mark = mark
    @name = name
    @turn = turn
    @score = score
  end

  def choose_position(board, number)
    symbol = Symbol.new(@mark, number)
    board.add_symbol(symbol)
  end

  def win
    @score += 1
  end

  def lose; end
end
