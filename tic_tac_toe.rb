# frozen_string_literal: true

require_relative './board'
require_relative './player'
require_relative './symbol'

# Defines the game engine
class Game
  attr_accessor :player1, :player2, :board

  def initialize
    new_game
  end

  def create_players
    puts 'TIC TAC TOE'
    puts 'What is your name player 1?'
    player1_name = gets.chomp
    @player1 = Player.new('X', player1_name, 0, 0)
    puts 'What is your name player 2?'
    player2_name = gets.chomp
    @player2 = Player.new('O', player2_name, 0, 0)
  end

  def create_board
    @board = Board.new(3, 3)
  end

  def new_game
    create_players
    create_board
  end

  def round; end
  
end

Game.new
