# If we have this class:

class Game
  def play
    "Start the game!"
  end
end

# And another class:

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin

What can we add to the Bingo class to allow it to inherit
the play method from the Game class?

#####

When defining the Bingo class, we can append Bingo with
`< Game` which will cause Bingo to subclass from Game, meaning
that any instance methods defined therein will be available
to be called on instance of Bingo; this includes the `#play`
instance method.

=end

game_of_bingo = Bingo.new
p game_of_bingo.play