# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

=begin

What is the difference in the way the code works?

#####

The sole difference in how the code for these two methods work can be found in
how they implement the `create_template` methods.

The first Computer class definition references the `template` attribute directly
through it's instance variable, and assigns it to the string.

The second Computer class definition references the `template` attribute by way
of it's setter method, which might mean in certain circumstances that any other
logic that may have been stored in that setter would also be evaluated, which
would likely be desirable if the setter had been defined in that way.

In the context of a setter method created by way of an attr_accessor invocation,
the difference is nonexistent, but we do tend to prefer to use setters and getters
over directly working with instance variables anyway, so we might still choose
to do so.

It can be noted that both class definitions implement `show_template` in the same
way, but we can further note that the second definition of `show_template` makes
an arbitrary reference to `self` ~ it is being used to call the getter method on
the calling object, but with getter methods, we don't need to do this; it's only
with setter methods that we've got to explicitly state that we're reassigning an
attribute so that Ruby doesn't interpret our code as local variable instantiation.

=end
