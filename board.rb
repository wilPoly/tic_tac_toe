# frozen_string_literal: true

# Board of the game
class Board
  def initialize(rows, columns)
    @board = [Array.new(rows) { Array.new(columns) }]
    @symbols = []
  end

  def state?; end

  # work in progress
  def draw_board
    # draw the board with the board content.
    # if a cell == nil add a number
  end

  def add_symbol(symbol)
    @symbols << symbol
    @symbols.each do |symbol|
      @board.at(symbol.position) = symbol.mark
    end
  end
end

# board = Board.new(3, 3)
# board.draw_board
