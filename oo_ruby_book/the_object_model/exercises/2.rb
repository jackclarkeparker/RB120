=begin

What is a module? What is its purpose? How do we use them with our classes?

A module is a set of behaviours that can be used in any number of different classes.
It is one way of enabling polymorphism in our code; this allows us to build a
program that operates on the level of many small independent limbs, rather than
a giant massively dependant blob of a program.

A module can be included in a class by using the `include` method, such that all
the behaviours (methods) that are defined in the module can be used with that
particular class, or any other that includes the module. The terminology for
this process is that we are 'mixing in' a given module with a given class.

=end

# Create a module for the class you created in exercise 1 and include it properly.

module Squawk
  def squawk(cry)
    1.upto(14) do
      puts cry * (rand(5))
      sleep(rand(0))
    end
    puts "SQUAAAAAAAAWK!!!!!!!!!"
  end
end

class Parrot
  include Squawk
end

bird = Parrot.new
bird.squawk('caCAW')

