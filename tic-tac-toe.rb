class Player
  attr_accessor :name, :letter

  def initialize
    puts 'Enter your name and choose either "X" or "O":'
    @name = gets.chomp
    @letter = gets.chomp
  end

  def turn
    Game.show_board
    puts "#{name}, type a number where you want to put your #{letter}:"
    number = gets.chomp
    Game.change_board(number, letter)
  end
end

class Game
  @@board = []
  @@state = false
  @@used_numbers = []
  
  def initialize
    @player1 = Player.new
    @player2 = Player.new

    @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @@state = true

    puts "Game starts now!"

    while @@state
      @player1.turn
      @player2.turn
    end
  end

  def self.change_board(number, letter)
    b = @@board
    number = number.to_i - 1
    b[number] = letter
    @@used_numbers.push number
  end

  def self.show_board
    b = @@board
    puts(
      "\n" + b[0].to_s + " | " + b[1].to_s + " | " + b[2].to_s + 
      "\n" + b[3].to_s + " | " + b[4].to_s + " | " + b[5].to_s + 
      "\n" + b[6].to_s + " | " + b[7].to_s + " | " + b[8].to_s + "\n "
    )
  end
end

game = Game.new