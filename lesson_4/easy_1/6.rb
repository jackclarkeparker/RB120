=begin

What could we add to the class below to access the
instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

#####

We could add a getter method for the `@volume` instance variable.
This can either be done in longhand by defining an instance
method called `volume` which simply returns `@volume`, or
by invoking an `attr_reader` method and passing in the symbol
`:volume` as an argument, which will generate the getter for
us.

If we'd also like to be able to set `@volume` to new values,
we could use an `attr_accessor` instead, which would give us
both the getter and setter method for `@volume`.

=end