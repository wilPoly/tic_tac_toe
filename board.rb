# frozen_string_literal: true

# Board of the game
class Board
  def initialize(rows, columns)
    cell_number = 0
    # initialize board with number from 1 to rows*columns
    @board = Array.new(rows) do
      Array.new(columns) do
        cell_number += 1
      end
    end
    @marks = []
  end

  def add_mark(mark)
    @marks << mark
    # @symbols.each do |symbol|
    #   @board.at(symbol.position) = symbol.mark
    # end
  end

  def draw_board
    @board.each do |row|
      row.each do |cell|
        print "|#{cell}"
      end
      puts "|\n"
    end
  end
end

# board = Board.new(3, 3)
# board.draw_board
