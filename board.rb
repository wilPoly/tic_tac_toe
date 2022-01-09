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
    @board.each_with_index do |row, i|
      row.each_index do |j|
        @board[i][j] = mark.type if @board[i][j] == mark.position
      end
    end
    @marks << mark
  end

  def convert_mark_position(mark); end

  def draw_board
    @board.each do |row|
      row.each do |cell|
        print "|#{cell}"
      end
      puts "|\n"
    end
  end
end
