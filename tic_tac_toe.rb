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
    round until @end_game
  end

  def round
    active_player = start_turn(@players)
    p active_player
    puts "Your turn, #{active_player.name}.\n"
    @board.draw_board
    position = @board.check_position
    active_player.choose_position(@board, position)
    @board.draw_board
    binding.pry
    win(active_player) if @board.win?(active_player)
    end_turn(@players)
  end

  def start_turn(players)
    active_player = nil
    players.each { |player| active_player = player if player.turn }
    active_player
  end

  def end_turn(players)
    players.each { |player| player.turn = player.turn ? false : true }
  end

  def win(player)
    puts "#{player.name} wins !"
    @board.draw_board
    player.score += 1
    display_score
    @end_game = true
  end

  def display_score
    @players.each { |player| puts "#{player.name}'s score: #{player.score}\n" }
  end
end

Game.new
