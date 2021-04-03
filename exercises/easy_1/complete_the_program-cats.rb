=begin

Consider the following program.

PEDAC

EXPLICIT

Update the code to match the output

IMPLICIT

- Currently `Pet` contains two attributes, but three arguments are passed in
  with the test cases, so we need another parameter and instance variable
  upon initialization.

- `puts` is displaying it's argument objects using a bespoke formatting that
  must need to be defined in a custom `to_s` instance method.


=end

class Pet
  attr_reader :name, :age, :colour

  def initialize(name, age, colour)
    @name = name
    @age = age
    @colour = colour
  end
end

class Cat < Pet
  def to_s
    "My cat #{name} is #{age} years old and has #{colour} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.