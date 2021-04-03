=begin

If we have a Car class and a Truck class and we want to be
able to go_fast, how can we add the ability for them to
go_fast using the module Speed?
How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

#####

We've got to include the `Speed` module in each of the Car
and Truck classes so that the mix-in's methods are available
for use.

To check to see whether this has worked, we can invoke
the #ancestors method on each of the classes to check their
respective lookup paths. If we've correctly included Speed,
then it should be the second entry in the returned look up
path array.

(LS says try it is how you can test to see whether the
method now works)

=end