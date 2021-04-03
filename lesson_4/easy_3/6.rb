# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

=begin

In the make_one_year_older method we have used self. What is another way we could write
this method so we don't have to use the self prefix?

- We could instead prefix age with @, but such that we directly reassigned that instance
  variable instead of taking the pathway of it's setter to alter it's value.
  - I don't think we generally want to do this though, because it's cleanest to
    tend towards using the logic stored in a setter method in case there are any
    other operations that have been defined to be carried out simulataneous to
    setting this value; the preference is to use the setter method.

I may be wrong about this, but I don't know of another way of changing @age than using
the setter method with `self.` prepended syntax, or of incrementing via the instance variable
itself.


=end
