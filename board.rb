# frozen_string_literal: true

# Board of the game
class Board
  def initialize(rows, columns)
    @board = Array.new(rows) { Array.new(columns) }
    @symbols = []
  end

  def state?; end

  def add_symbol(symbol)
    @symbols << symbol
    @symbols.each do |symbol|
      @board.at(symbol.position) = symbol.mark
    end
  end

  # work in progress
  # draw the board with the board content
  # if a celle == nil => add a number
  # -------
  # def draw_board
  #   @board.each do |rows|
  #     rows.each do
  #       print '|__|'
  #     end
  #     print "\n"
  #     puts '------'
  #   end
  # end
  # ------
end

# board = Board.new(3, 3)
# board.draw_board
