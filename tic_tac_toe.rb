# frozen_string_literal: true

require_relative './board'
require_relative './player'
require_relative './mark'
require 'pry-byebug'

# Defines the game engine
class Game
  attr_accessor :player1, :player2, :board

  def initialize
    puts 'TIC TAC TOE'
    @players = []
    new_game
    @end_game = false
  end

  def create_player(number, mark, turn)
    puts "What is your name player #{number}?"
    name = gets.chomp
    puts "Hello #{name}, your mark is #{mark}"
    puts "\n"
    Player.new(mark, name, turn)
  end

  def create_board
    @board = Board.new(3, 3)
  end

  def new_game
    @player1 = create_player(1, 'X', turn: true)
    @players << @player1
    @player2 = create_player(2, 'O', turn: false)
    @players << @player2
    create_board
    round # until @end_game
  end

  def round
    active_player = @players.filter(player.turn)
    puts "Your turn, #{active_player.name}.\n" \
        'Choose a position for your mark.'
    @board.draw_board
    position = gets.chomp.to_i
    active_player.choose_position(@board, position)
    @board.draw_board
    end_turn(@players)
  end

  def end_turn(players)
    players.each { |player| player.turn = player.turn ? false : true }
  end
end

Game.new
