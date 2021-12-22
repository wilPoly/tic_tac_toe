# frozen_string_literal: true

# Board of the game
class Board
  def initialize(rows, columns)
    @board = Array.new(rows) { Array.new(columns) }
  end

  def state?; end

  # work in progress
  def draw_board
    @board.each do |rows|
      rows.each do
        print '|__|'
      end
      print "\n"
      puts '------'
    end
  end
end

# board = Board.new(3, 3)
# board.draw_board
