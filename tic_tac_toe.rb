require 'pry-byebug'

class Player
  attr_accessor :name, :letter

  def initialize(name, letter)
    # puts 'Enter your name and choose either "X" or "O":'
    @name   = name # gets.chomp
    @letter = letter # gets.chomp
  end

  def input
    print "#{name}, type a number where you want to put your #{letter}: "
    gets.chomp
  end
end

class Game
  attr_accessor :board, :state, :used_numbers

  def initialize
    @player1  = Player.new('Oleg', 'X')
    @player2  = Player.new('Sanzhar', 'O')

    @board    = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @state    = true
    @used_numbers = []

    puts 'Game starts now!'

    while @state
      turn(@player1)
      turn(@player2)
    end
  end

  def turn(player)
    show_board
    number = player.input

    while used_numbers.include? number.to_i
      print 'Number is already used. Please type another number: '
      player.input
    end

    change_board(number, player.letter)
  end

  def change_board(number, letter)
    number = number.to_i - 1
    board[number] = letter
    used_numbers.push(number + 1)
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

game = Game.new
