# frozen_string_literal: true

require_relative './board'
require_relative './player'
require_relative './symbol'

# Defines the game engine
class Game
  attr_accessor :player1, :player2, :board

  def initialize
    puts 'TIC TAC TOE'
    new_game
  end

  def create_player(number, mark)
    puts "What is your name player #{number}?"
    name = gets.chomp
    puts "Hello #{name}, your mark is #{mark}"
    puts "\n"
    Player.new(mark, name)
  end

  def create_board
    @board = Board.new(3, 3)
  end

  def new_game
    @player1 = create_player(1, 'X')
    @player2 = create_player(2, 'O')
    create_board
  end

  def round; end
end

Game.new
