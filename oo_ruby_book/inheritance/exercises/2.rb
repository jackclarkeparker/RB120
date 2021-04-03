=begin

Add a class variable to your superclass that can keep track of the number of
objects created that inherit from the superclass. Create a method to print out
the value of this class variable as well.

=end

class Pets
  @@number_of_pets = 0

  def initialize(colour, age)
    @colour = colour
    @age = age
    @@number_of_pets += 1
  end

  def self.number_of_pets
    @@number_of_pets
  end
end

class Cats < Pets

end

class Dogs < Pets

end

class GuineaPigs < Pets

end

class Budgies < Pets

end

cat = Cats.new('tabby', 5)
dawg = Dogs.new('grey', 13)
puts Pets.number_of_pets