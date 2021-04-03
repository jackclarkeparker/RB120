#*#*#* @name references a String object

# class Person
#   def initialize(name)
#     @name = name
#   end

#   def name
#     @name
#   end
# end

# joe = Person.new("Joe")
# p joe.name

# ------------ ------------ ------------ ------------ ------------ ------------

#*#*#* it doesn't need to though. Instance variables can reference any object
#*#*#* type, here's an example using some data structures

# class Person
#   def initialize
#     @heroes = ["Superman", "Spiderman", "Batman"]
#     @cash = { 'ones' => 12, 'fives' => 2, 'tens' => 0, 'twenties' => 2, 'hundreds' => 0}
#   end

#   def cash_on_hand
#     # this method will use @cash to calculate total cash value
#     # we'll skip the implementation
#   end

#   def heroes
#     @heroes.join(', ')
#   end
# end

# joe = Person.new
# p joe.cash_on_hand # => '$62.00'
# p joe.heroes       # => "Superman, Spiderman, Batman"'

# ------------ ------------ ------------ ------------ ------------ ------------

#*#*#* Instance variables can even be set to any object type, including custom
#*#*#* objects that we've created:

# class Person
#   attr_accessor :name, :pet

#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Robert")
# bud = Bulldog.new             # assume Bulldog class from previous assignment

# bob.pet = bud

# ------------ ------------ ------------ ------------ ------------ ------------

#*#*#* An example where an instance variable referencing a collection of
#*#*#* collaborator objects:

# class Person
#   attr_accessor :name, :pets

#   def initialize(name)
#     @name = name
#     @pets = []
#   end
# end

# bob = Person.new("Robert")

# kitty = Cat.new
# bud = Bulldog.new

# bob.pets << kitty
# bob.pets << bud

# bob.pets          # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]

### Because `@pets` is an array, you can't call Pet methods on it directly:

# bob.pets.jump                  # NoMethodError: undefined method `jump' for [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]:Array

### But you can do this:

# bob.pets.each do |pet|
#   pet.jump
# end