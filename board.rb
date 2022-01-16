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
    @win_condition =
      { diagonal1: [1, 5, 9], diagonal2: [3, 5, 7],
        row1: [1, 2, 3], row2: [4, 5, 6], row3: [7, 8, 9],
        column1: [1, 4, 7], column2: [2, 5, 8], column3: [3, 6, 9] }
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
  end

  def draw_board
    puts "\n"
    @board.each do |row|
      row.each do |cell|
        print "|#{cell}"
      end
      puts "|\n"
    end
    puts "\n"
  end

  def win?(player)
    win = false
    @win_condition.each do |_k, v|
      if player.marks_positions.filter { |i| v.include?(i) } == v
        win = true
        break
      end
    end
    win
  end
end
