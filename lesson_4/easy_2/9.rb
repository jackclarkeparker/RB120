=begin

If we have this class:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

What would happen if we added a play method to the Bingo
class, keeping in mind that there is already a method of
this name in the Game class that the Bingo class inherits
from.

#####

If we were to introduce a `play` method to the Bingo class,
then invocations of `play` on Bingo object would now
reference this new method definition; methods defined in
subclasses override those defined in superclasses.

=end