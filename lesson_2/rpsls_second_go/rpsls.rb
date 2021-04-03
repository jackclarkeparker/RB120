require 'yaml'

MESSAGES = YAML.load_file('game_messages.yml')

RULES = MESSAGES['rule_messages']
HUMAN_MESSAGES = MESSAGES['human_messages']
OPPONENT_MESSAGES = MESSAGES['opponent_messages']
RPS_MESSAGES = MESSAGES['rps_messages']

# This is used for "dramatic" effect during message display sequences
module MessagePender
  def display_pending
    2.times do
      print '.'
      sleep(0.6)
    end
    puts '.'
    sleep(1)
  end
end

# This pauses flow of execution until user gives input
module Pauseable
  def type_to_continue
    puts "\n   Press enter to continue"
    gets
  end
end

# This returns a full length version of an input so that single char input can
# be counted as full length input.
module EasilyEnterable
  def find_full_length(char, options)
    options.find { |move| move.start_with?(char) }
  end
end

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  # 1) Move objects are not directly initialized, instead the subclass
  #    specifications of move objects are used; Rock, Paper, Scissors.. objects
  def self.initialize_move_type(choice)
    case choice
    when 'rock'     then Rock.new
    when 'paper'    then Paper.new
    when 'scissors' then Scissors.new
    when 'lizard'   then Lizard.new
    when 'spock'    then Spock.new
    end
  end

  # 2) The subclasses of Move inherit their constructor from Move here
  def initialize
    @value = class_to_string
  end

  # 3) This helper method returns a string version of the class name which is
  #    then stored in the @value attribute of the caller (used for displaying
  #    and comparison purposes)
  def class_to_string
    self.class.to_s.downcase
  end

  def to_s
    @value
  end

  protected

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end
end

class Rock < Move
  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end
end

class Paper < Move
  def >(other_move)
    other_move.spock? || other_move.rock?
  end
end

class Scissors < Move
  def >(other_move)
    other_move.paper? || other_move.lizard?
  end
end

class Lizard < Move
  def >(other_move)
    other_move.spock? || other_move.paper?
  end
end

class Spock < Move
  def >(other_move)
    other_move.rock? || other_move.scissors?
  end
end

class Player
  include MessagePender

  attr_accessor :move, :score, :move_history
  attr_reader :name

  # This class variable stores the player objects for human and computer so
  # that the computer personalities can have access to the human's move history
  # to base their moves against (they can reference the human object via this
  # class variable)
  @@players = []

  def initialize
    set_name
    @score = 0
    @move_history = []
    @@players << self
  end

  def to_s
    name
  end

  private

  attr_writer :name
end

class Human < Player
  include EasilyEnterable

  def choose
    choice = nil
    loop do
      puts HUMAN_MESSAGES['move_prompt']
      choice = gets.chomp.downcase
      break if input_options.include?(choice)
      puts HUMAN_MESSAGES['move_invalid_input']
    end
    choice = find_full_length(choice, Move::VALUES)
    self.move = Move.initialize_move_type(choice)
    move_history << choice
  end

  private

  def set_name
    system('clear')
    n = ""
    loop do
      puts HUMAN_MESSAGES['name_prompt']
      n = gets.chomp
      break unless n.empty?
      puts HUMAN_MESSAGES['name_invalid_input']
    end
    self.name = n
  end

  # This gives an array of all acceptable options for user input
  def input_options
    Move::VALUES + %w(r p sc l sp)
  end
end

class Computer < Player
  PERSONALITIES = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def choose
    choice = Move::VALUES.sample
    self.move = Move.initialize_move_type(choice)
    move_history << choice
  end

  def display_introduction
    puts "\n\n__SCROUNGE_BOT__"
    sleep(1)
    print "BOOT SEQUENCE"
    display_pending
    display_description
  end

  def self.initialize_personality
    name = Computer::PERSONALITIES.sample
    case name
    when 'R2D2'     then R2D2.new
    when 'Hal'      then Hal.new
    when 'Chappie'  then Chappie.new
    when 'Sonny'    then Sonny.new
    when 'Number 5' then Number5.new
    end
  end
end

class R2D2 < Computer
  # R2D2 searches the player's move history and choose a move that will beat
  # the move they made two turns ago.
  def choose
    return super if move_history.size < 2

    human_choice_two_rounds_prior = @@players[0].move_history[-3]
    choice = nil
    loop do
      choice = Move::VALUES.sample
      @move = Move.initialize_move_type(choice)
      break if move > Move.initialize_move_type(human_choice_two_rounds_prior)
    end
    move_history << choice
  end

  private

  R2D2_DESCRIPTION = OPPONENT_MESSAGES["r2d2"]["description_messages"]

  def set_name
    @name = 'R2D2'
  end

  def display_description
    puts R2D2_DESCRIPTION[1]
    sleep(1)
    puts R2D2_DESCRIPTION[2]
    sleep(2.6)
    puts R2D2_DESCRIPTION[3]
    sleep(2)
    puts R2D2_DESCRIPTION[4]
    sleep(2.6)
  end
end

class Hal < Computer
  # Hal chooses a move that will beat his own last move
  def choose
    return super if move_history.empty?

    last_move = move_history[-1]
    choice = nil
    loop do
      choice = Move::VALUES.sample
      @move = Move.initialize_move_type(choice)
      break if move > Move.initialize_move_type(last_move)
    end
    move_history << choice
  end

  private

  HAL_DESCRIPTION = OPPONENT_MESSAGES['hal']['description_messages']

  def display_description
    puts HAL_DESCRIPTION[1]
    sleep(1)
    puts HAL_DESCRIPTION[2]
    sleep(2)
  end

  def set_name
    @name = 'Hal'
  end
end

class Chappie < Computer
  # Chappie always uses the same move at least twice
  def choose
    last_move = move_history[-1]
    if move_history[-2] == last_move
      super
    else
      @move = Move.initialize_move_type(last_move)
      move_history << last_move
    end
  end

  private

  CHAPPIE_DESCRIPTION = OPPONENT_MESSAGES["chappie"]["description_messages"]

  def display_description
    puts CHAPPIE_DESCRIPTION[1]
    sleep(1)
    puts CHAPPIE_DESCRIPTION[2]
    sleep(1.5)
    puts CHAPPIE_DESCRIPTION[3]
    sleep(3)
  end

  def set_name
    @name = 'Chappie'
  end
end

class Sonny < Computer
  # Sonny only uses the original three moves from RPS
  def choose
    choice = ['rock', 'paper', 'scissors'].sample
    @move = case choice
            when 'rock'     then Rock.new
            when 'paper'    then Paper.new
            when 'scissors' then Scissors.new
            end
    move_history << choice
  end

  private

  SONNY_DESCRIPTION = OPPONENT_MESSAGES['sonny']['description_messages']

  def display_description
    puts SONNY_DESCRIPTION[1]
    sleep(1)
    puts SONNY_DESCRIPTION[2]
    sleep(2)
  end

  def set_name
    @name = 'Sonny'
  end
end

class Number5 < Computer
  include EasilyEnterable

  def initialize
    super
    @move_number = 0
  end

  # Every 5 turns, Number 5 flips a coin, if you guess heads/tails right,
  # Number 5 will definitely choose a move that loses, if you choose wrong,
  # Number 5 will definitely choose a move that wins.
  # - Odds are weighted such that heads is your best bet on the first, third
  #   fifth time the coin is flipped, and that tails is your best bet on the
  #   second, fourth, sixth time, etc.
  def choose
    self.move_number += 1
    if move_number % 5 == 0
      coinflip_sequence
    else
      puts "\n  #{('• ' * (move_number % 5))}\n\n"
      super
    end
  end

  private

  NUMBER5_DESCRIPTION = OPPONENT_MESSAGES['number_5']['description_messages']
  COINFLIP_MESSAGES = OPPONENT_MESSAGES['number_5']['coinflip']
  COINFLIP_DRAMA = COINFLIP_MESSAGES['drama']

  attr_accessor :move_number

  def set_name
    @name = 'Number 5'
  end

  def display_description
    puts NUMBER5_DESCRIPTION[1]
    sleep(1.4)
    print NUMBER5_DESCRIPTION[2]
    display_pending
    puts NUMBER5_DESCRIPTION[3]
    sleep(2)
  end

  def display_coinflip_intro
    sleep(1)
    amount_of_messages = COINFLIP_DRAMA.size
    1.upto(amount_of_messages) do |number|
      puts COINFLIP_DRAMA[number]
      sleep(2.5)
    end
  end

  def display_coinflip_outcome(flip)
    print COINFLIP_MESSAGES['outcome']
    sleep(1.5)
    puts "It's a #{flip}!\n\n"
    sleep(2.5)
  end

  def coinflip_sequence
    options = (move_number % 10 == 0 ? ['tails', 'heads'] : ['heads', 'tails'])
    favoured, unfavoured = options

    guess = retrieve_coinflip_choice
    puts "You guess #{guess}."

    outcome = rand(100) < 75 ? favoured : unfavoured
    display_coinflip_outcome(outcome)
    fated_outcome(outcome.start_with?(guess))
  end

  def retrieve_coinflip_choice
    display_coinflip_intro if move_number == 5
    puts COINFLIP_MESSAGES['prompt']

    guess = nil
    loop do
      guess = gets.chomp.downcase
      break if %w(heads tails h t).include?(guess)
      puts COINFLIP_MESSAGES['invalid_input']
    end
    find_full_length(guess, ['heads', 'tails'])
  end

  def fated_outcome(human_correct)
    human_move = Move.initialize_move_type(@@players[0].move_history.last)
    choice = nil
    loop do
      choice = Move::VALUES.sample
      @move = Move.initialize_move_type(choice)
      break if
        (human_correct && human_move > move) ||
        (!human_correct && move > human_move)
    end
    move_history << choice
  end
end

class Rules
  include Pauseable

  def initialize
    @rules_prompt_grammar = 'the'
    rules_loop
  end

  private

  def open_rules?
    answer = nil
    loop do
      puts "Would you like to take a look at #{@rules_prompt_grammar} "\
           "rules? (y/n)"
      answer = gets.chomp.downcase
      break if %w(yes no y n).include?(answer)
      puts RULES["open_rules_invalid_input"]
    end
    @rules_prompt_grammar = 'any other'
    answer.start_with?('y')
  end

  def rules_loop
    while open_rules?
      display_rules_menu
      choice = retrieve_rules_menu_input
      case choice
      when 'g' then display_general_rules
      when 'm' then display_move_rules
      when 'o' then display_opponent_info
      when 'r' then break
      end
    end
  end

  def display_rules_menu
    system('clear')
    puts RULES["display_menu"]
  end

  def retrieve_rules_menu_input
    loop do
      choice = gets.chomp.downcase
      return choice if %w(g m o r).include?(choice)
      puts RULES["rules_menu_invalid_input"]
    end
  end

  def display_general_rules
    system("clear")
    puts "GENERAL RULES\n\n".center(80)
    print_message_sequence('general_rules')
  end

  def display_move_rules
    system("clear")
    puts "MOVE RULES\n\n".center(80)
    print_message_sequence('move_rules')
  end

  def display_opponent_info
    system("clear")
    puts "OPPONENT INFORMATION\n\n".center(80)
    print_message_sequence('opponent_info')
  end

  def print_message_sequence(rule_type)
    sleep(1)
    amount_of_messages = RULES[rule_type].size
    1.upto(amount_of_messages) do |number|
      puts RULES[rule_type][number]
      sleep(2.5)
    end
    type_to_continue
  end
end

# Game Orchestration Engine
class RPSGame
  include MessagePender, Pauseable

  def initialize
    display_welcome_message
    display_rules
    @human = Human.new
    @computer = Computer.initialize_personality
    computer.display_introduction
  end

  def play
    loop do
      match_loop
      system('clear')
      display_grand_winner
      play_again? ? reset_scores : break
    end
    display_goodbye_message
  end

  private

  attr_accessor :human, :computer

  def display_welcome_message
    system('clear')
    puts RPS_MESSAGES['welcome']
    sleep(1.2)
  end

  def display_rules
    Rules.new
  end

  def display_goodbye_message
    system('clear')
    puts RPS_MESSAGES['goodbye']
    sleep(2)
    system('clear')
  end

  def match_loop
    loop do
      display_scoreboard
      human.choose
      computer.choose
      close_out_round
      break if find_grand_winner
      display_move_history
    end
  end

  def display_scoreboard
    system('clear')
    puts RPS_MESSAGES['scoreboard_header']
    puts "#{human}: #{human.score}   |   #{computer}: #{computer.score}"
  end

  def close_out_round
    winner = find_winner
    update_score(winner)
    display_result(winner)
  end

  def find_winner
    if human.move > computer.move
      :human
    elsif computer.move > human.move
      :computer
    else
      :tie
    end
  end

  def update_score(winner)
    if winner == :human
      human.score += 1
    elsif winner == :computer
      computer.score += 1
    end
  end

  def display_result(winner)
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}.\n\n"

    case winner
    when :human    then puts "#{human} won!"
    when :computer then puts "#{computer} won!"
    when :tie      then puts "It's a tie!"
    end
    sleep(1.3)
  end

  def find_grand_winner
    [human, computer].find { |player| player.score == 10 }
  end

  def display_move_history
    system('clear')
    rounds_played = human.move_history.size

    puts RPS_MESSAGES['move_history_header']
    puts "#{human.name.rjust(13)}   #{computer.name}\n\n"
    (0...rounds_played).each do |round|
      puts line_of_history(round)
    end
    type_to_continue
  end

  def line_of_history(round)
    human_move = human.move_history[round]
    computer_move = computer.move_history[round]
    round_number = (round + 1).to_s
    "#{round_number.ljust(2)} #{human_move.rjust(10)} | #{computer_move}"
  end

  def display_grand_winner
    grand_winner = find_grand_winner
    print RPS_MESSAGES['grand_winner_announcer']
    display_pending
    40.times do
      print_name_to_screen_width(grand_winner)
    end
  end

  def print_name_to_screen_width(grand_winner)
    formatted_name = grand_winner.name.upcase + ' '
    times_to_print = 80 / formatted_name.length
    (times_to_print - 1).times do
      print formatted_name
      sleep(0.002)
    end
    puts formatted_name
  end

  def play_again?
    answer = nil

    loop do
      puts RPS_MESSAGES['play_again_prompt']
      answer = gets.chomp.downcase
      break if ['y', 'n'].include?(answer)
      puts RPS_MESSAGES['play_again_invalid_input']
    end
    sleep(1)
    return false if answer.downcase == 'n'
    return true  if answer.downcase == 'y'
  end

  def reset_scores
    computer.score = 0
    human.score = 0
  end
end

RPSGame.new.play
