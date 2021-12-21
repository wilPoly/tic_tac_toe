# frozen_string_literal: true

# Defines player object
class Player
  attr_reader :mark
  attr_accessor :name, :turn, :score

  def initialize(mark, name, turn, score)
    @mark = mark
    @name = name
    @turn = turn
    @score = score
  end

  def choose_position(number); end

  def win
    @score += 1
  end

  def lose; end
end
