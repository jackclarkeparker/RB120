=begin

You have the following classes.

=end

class Animal
  def initialize(name)
    @name = name
  end

  def walk
    "#{@name} #{gait} forward"
  end
end

class Person < Animal
  attr_reader :name

  private

  def gait
    "strolls"
  end
end

class Cat < Animal
  attr_reader :name

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  attr_reader :name

  private

  def gait
    "runs"
  end
end

# You need to modify the code so that this works:

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

# You are only allowed to write one new method to do this.

# They would have liked me to make a Walkable module to solve this, and to then
# mix it in with each of the classes proffered. Because all these classes *have*
# the ability to walk.
# Each of these class *is* also an animal, but perhaps thinking of People
# as a subclass of Animals is not always a useful way of structuring their data
