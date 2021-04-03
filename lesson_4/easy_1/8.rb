=begin

If we have a class such as the one below:

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

You can see in the make_one_year_older method we have
used self. What does self refer to here?

#####

In this case `self` will refer to the object that calls the
`make_one_year_older` method. We know this because this
method is an instance method, and when `self` is referenced
from within an instance method, it is always referring
to the calling object.

=end