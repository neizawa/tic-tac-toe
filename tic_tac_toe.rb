require 'pry-byebug'

class Player
  attr_accessor :name, :letter, :numbers

  def initialize(letter)
    print "Enter name for an #{letter} player: "
    @name    = gets.chomp
    @letter  = letter
    @numbers = []
  end
end

class Game
  attr_accessor :player1, :player2, :board, :used_numbers

  LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def initialize
    @player1      = Player.new('X')
    @player2      = Player.new('O')
    @board        = [1,2,3,4,5,6,7,8,9]
    @used_numbers = []

    puts 'Game starts now!'
    play_turns
  end

  def play_turns
    9.times do
      turn(player1)
      turn(player2)
    end
  end

  def check_lines
    LINES.each do |line|
      if player1.numbers.select { |number| line.include? number } == line then finish_game(player1, player2); end
      if player2.numbers.select { |number| line.include? number } == line then finish_game(player2, player1); end
    end
  end

  def finish_game(player, opponent)
    puts "Game finished! #{player.name} won #{opponent.name}."
    Game.new
  end

  def input
    number = gets.chomp.to_i

    if used_numbers.include? number
      print 'Slot is already used. Please type another number: '
      input
    else
      number
    end
  end

  def turn(player)
    show_board
    print "#{player.name}, type a number of a slot where you want to put your #{player.letter}: "
    number = input

    change_board(number, player.letter)
    used_numbers.push(number)
    player.numbers.push(number)
    check_lines
  end

  def change_board(number, letter)
    board[number - 1] = letter
  end

  def show_board
    b = board
    puts(
      "\n #{b[0]} | #{b[1]} | #{b[2]}
      \n #{b[3]} | #{b[4]} | #{b[5]}
      \n #{b[6]} | #{b[7]} | #{b[8]}\n "
    )
  end
end

Game.new
