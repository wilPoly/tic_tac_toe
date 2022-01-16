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
    @player1 = create_player(1, 'X', turn: true)
    @players << @player1
    @player2 = create_player(2, 'O', turn: false)
    @players << @player2
    new_game
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
    p @board
  end

  def clear_marks
    @players.each(&:clear_marks)
  end

  def new_game
    @game_end = false
    create_board
    clear_marks
    round until @game_end
    end_game
  end

  def round
    active_player = start_turn(@players)
    puts "Your turn, #{active_player.name}.\n"
    @board.draw_board
    position = @board.check_position
    active_player.choose_position(@board, position)
    @board.draw_board
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
    @game_end = true
  end

  def display_score
    @players.each { |player| puts "#{player.name}'s score: #{player.score}\n" }
  end

  def end_game
    puts 'Would you like to play again'
    answer = gets.chomp.downcase
    if answer.include?('y')
      new_game
    else
      exit(0)
    end
  end
end

Game.new
