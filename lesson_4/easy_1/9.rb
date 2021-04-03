=begin

If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

In the name of the cats_count method we have used self.
What does self refer to in this context?

#####

In this context, the `self` refers to the Cat class, and
the `cats_count` method turns out to be a class method,
not an instance method.

Any time that `self` is referenced from outside of the
context of an instance method, it references the class.

=end