# frozen_string_literal: true

# Defines the symbols on the board
class Symbol
  attr_reader :mark, :position

  def initialize(mark, position)
    @mark = mark
    @position = position
  end
end
