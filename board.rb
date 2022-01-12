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

  def check_position
    position = 0
    until @board.flatten.include?(position)
      puts 'Which position do you want to mark?'
      position = gets.chomp.to_i
      unless @board.flatten.include?(position)
        puts "You can't play here!"
        redo
      end
    end
    position
  end

  def add_mark(mark)
    @board.each_with_index do |row, i|
      row.each_index do |j|
        @board[i][j] = mark.type if @board[i][j] == mark.position
      end
    end
    @marks << mark
  end

  def draw_board
    @board.each do |row|
      row.each do |cell|
        print "|#{cell}"
      end
      puts "|\n"
    end
  end

  def win?(player)
    win = false
    win_condition =
      { diagonal1: [@board[0][0], @board[1][1], @board[2][2]],
        diagonal2: [@board[0][2], @board[1][1], @board[2][0]],
        row1: [@board[0][0], @board[0][1], @board[0][2]],
        row2: [@board[1][0], @board[1][1], @board[1][2]],
        row3: [@board[2][0], @board[2][1], @board[2][2]],
        column1: [@board[0][0], @board[1][0], @board[2][0]],
        column2: [@board[0][1], @board[1][1], @board[2][1]],
        column3: [@board[0][2], @board[1][2], @board[2][2]] }
    win_condition.each do |_k, v|
      if v.all? { |i| i == player.mark_type }
        win = true
        break
      end
    end
    win
  end
end
