require 'pry'
require 'pry-byebug'

module Dramatifiable
  def display_dramatic_pause
    3.times do
      sleep(0.6)
      print '.'
    end
    sleep(1)
    puts
  end
end

class ScoreBoard
  attr_accessor :human, :computer

  def initialize(human, computer)
    @human = human
    @computer = computer
  end

  def reset
    human.score = 0
    computer.score = 0
  end

  def game_over?
    [human.score, computer.score].any? { |score| score == 10 }
  end

  def to_s
    system('clear')
    puts "------SCOREBOARD------\n"
    "#{human.name}: #{human.score}      #{computer.name}: #{computer.score}\n\n"
  end
end

class Move
  attr_reader :choice, :value

  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @choice = case value
              when 'rock'     then Rock.new
              when 'paper'    then Paper.new
              when 'scissors' then Scissors.new
              when 'spock'    then Spock.new
              when 'lizard'   then Lizard.new
              end
    @value = value
  end

  def >(other_move)
    choice.won?(other_move.choice)
  end

  def <(other_move)
    other_move.choice.won?(choice)
  end

  def to_s
    choice.value
  end

  def scissors?
    value == 'scissors'
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def spock?
    value == 'spock'
  end

  def lizard?
    value == 'lizard'
  end
end

class Rock < Move
  attr_reader :value

  def initialize
    @value = 'rock'
  end

  def won?(other_move)
    other_move.lizard? || other_move.scissors?
  end
end

class Paper < Move
  attr_reader :value

  def initialize
    @value = 'paper'
  end

  def won?(other_move)
    other_move.rock? || other_move.spock?
  end
end

class Scissors < Move
  attr_reader :value

  def initialize
    @value = 'scissors'
  end

  def won?(other_move)
    other_move.paper? || other_move.lizard?
  end
end

class Spock < Move
  attr_reader :value

  def initialize
    @value = 'spock'
  end

  def won?(other_move)
    other_move.scissors? || other_move.rock?
  end
end

class Lizard < Move
  attr_reader :value

  def initialize
    @value = 'lizard'
  end

  def won?(other_move)
    other_move.spock? || other_move.paper?
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
    sleep(1.5)
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, spock, or lizard:"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors', 'spock', 'lizard'].include? choice
      puts "Sorry, invalid choice."
      sleep(1.2)
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  include Dramatifiable

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
    print "\n\nYour opponent will be"
    display_dramatic_pause
    puts "!!!! #{name.upcase} !!!!"
    sleep(2.5)
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  include Dramatifiable

  attr_accessor :human, :computer, :scoreboard

  def initialize
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
    @scoreboard = ScoreBoard.new(@human, @computer)
  end

  def display_welcome_message
    system('clear')
    puts "Welcome to Rock, Paper, Scissors!"
    sleep(1.2)
  end

  def reset_scores
    human.score = 0
    computer.score = 0
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def who_won
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def display_winner(winner)
    if winner
      puts "#{winner.name} won!"
    else
      puts "It's a tie!"
    end
    sleep(1.3)
  end

  def display_grand_winner
    system('clear')
    grand_winner = [human, computer].max_by(&:score)
    print "The victor is"
    display_dramatic_pause
    puts "\n#{grand_winner.name.upcase}!!!!"
    sleep(3)
  end

  def play_again?
    system('clear')
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n', 'yes', 'no'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase.start_with? 'n'
    return true if answer.downcase.start_with? 'y'
  end

  def game_sequence
    loop do
      puts scoreboard
      human.choose
      computer.choose
      display_moves
      winner = who_won
      winner.score += 1 if winner
      display_winner(winner)
      break if scoreboard.game_over?
    end
  end

  def play
    loop do
      reset_scores
      game_sequence
      display_grand_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
